class Api::V1::HomeController < Api::V1::AuthenticatedController
    def index
        render json: { message: "Hello API world! (user: #{current_user.email})" }
    end
end