class SessionsController < ApplicationController

    def new #log in page
        @user = User.new
    end

    def create #login user
    end

    def logout
    end
end