class ApplicationController < ActionController::Base
    def L4
       cookies[:c] || 0
       cookies[:c] = session[:c].to_i + 1
       render plain: session[:c]
    end
end
