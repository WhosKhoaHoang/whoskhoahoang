class ArnoldbotController < ApplicationController

    def show        
    end

    #NOTE: This action can only be called from an AJAX request!
    def msg_arnoldbot
        uri = URI("https://arnoldbot-api.herokuapp.com/talk?msg="+params[:msg])
        resp = Net::HTTP.get(uri)
        render json: resp
    end

end