class ApiTokensController < ApplicationController 
    def index 
        # FIXME: order by desc created_date
        @api_tokens = current_user.api_tokens
    end

    def create 
        @api_token = current_user.api_tokens.create!
        # FIXME: I guess because `create` is a post method, thus we cannot use `turbo_frame_tag` here.
        # FIXME: blow line of code does not work
        # render :turbo_stream
        respond_to do |format|
            format.turbo_stream
        end
    end

    def update
        @api_token = current_user.api_tokens.find(params[:id])
        @api_token.update(active: false)
        respond_to do |format|
            format.turbo_stream
        end
    end
end