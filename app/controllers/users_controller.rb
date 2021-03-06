class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            remember @user
            redirect_to posts_path
        else
            flash[:errors] = @user.errors.full_messages
            render 'new'
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
