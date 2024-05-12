class ApiTokensController < ApplicationController 
    def index 
        # DONE: order by desc created_date
        @api_tokens = current_user.api_tokens
    end

    def create 
        @api_token = current_user.api_tokens.create!
        # DONE: I guess because `create` is a post method, thus we cannot use `turbo_frame_tag` here.
        # I think so.
        # DONE: blow line of code does not work
        # Because its syntax is wrong
        # render :turbo_stream
        # DONE: No need to use `respond_to`, rails will automatically find the template
        # respond_to do |format|
        #     format.turbo_stream
        # end
    end

    def update
        @api_token = current_user.api_tokens.find(params[:id])
        @api_token.update(active: false)
        respond_to do |format|
            format.turbo_stream
        end
    end
end