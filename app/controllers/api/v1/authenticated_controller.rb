class Api::V1::AuthenticatedController < ActionController::Base
    skip_forgery_protection

    # DONE: What is request forgery protection???
    # Have a blog post regarding this topic
    before_action :authenticate

    before_action :check_api_limit

    before_action :log_api_request

    attr_reader :current_api_token, :current_user

    private 

    def authenticate
        authenticate_user_with_token || handle_bad_authentication
    end

    def authenticate_user_with_token 
        authenticate_with_http_token do |token, options|
            @current_api_token = ApiToken.where(active: true).find_by(token: token)
            @current_user = @current_api_token&.user
            @current_api_token.update(last_used_at: Time.zone.now)
        end
    end

    def handle_bad_authentication 
        render json: { message: "Bad credentials" }, status: :unauthorized
    end

    def log_api_request
        # FIXME: Seems the controller has access to current request, read the doc
        current_user.api_requests.create!(path: request.path, method: request.method)
        # FIXME: how to add response header fields?
        response.headers['X-Rayman-Api-Call-Limit'] = "#{current_user.remaining_api_request_count}/#{User::MAX_API_REQUEST_PER_30_DAYS}"
    end

    def check_api_limit 
        if current_user.api_request_limit_exceeded? 
            # FIXME: What is the status code of too_many_requests?
            render json: { message: "Api limit exceeded." }, status: :too_many_requests
        end
    end

end