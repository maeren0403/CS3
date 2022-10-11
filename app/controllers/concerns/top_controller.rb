class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    
    def login
   
    login_pass = BCrypt::Password.create("maeren")
       
       if User.find_by(uid: params[:uid], pass: BCrypt::Password.new(login_pass))
           session[:login_uid] = params[:uid]
           session[:login_pass] = params[:pass]
           redirect_to root_path
       else
            render 'error'
       end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
