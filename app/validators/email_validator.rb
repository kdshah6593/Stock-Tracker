!params[:user][:email].match(/\A[^@\s]+@[^@\s]+\z/)

class emailValidator < ActiveModel::Validator
    
end