class Api::V1::AuthenticatedController < ActionController::Base
    # DONE: What is request forgery protection???
    # Have a blog post regarding this topic
    before_action :authenticate

    attr_reader :current_api_token, :current_user

    private 

    def authenticate
        authenticate_user_with_token || handle_bad_authentication
    end

    def authenticate_user_with_token 
        authenticate_with_http_token do |token, options|
            @current_api_token = ApiToken.where(active: true).find_by(token: token)
            @current_user = @current_api_token&.user
        end
    end

    def handle_bad_authentication 
        render json: { message: "Bad credentials" }, status: :unauthorized
    end

end

