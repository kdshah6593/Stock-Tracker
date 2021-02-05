if params[:user][:username].match(/[^a-zA-Z0-9]/)
    flash[:message] = "Please follow the instructions below each field"

class usernameValidator < ActiveModel::Validator
    
end