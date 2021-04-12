class UsersController < ApplicationController

    # Only allow Authorized users to view and modify
    before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
    before_action :correct_user,   only: [:show, :edit, :update, :destroy]
    
    # Show user resource with matching id
    def show
        @user = User.find(params[:id])
    end

    # A new user resource with nil values
    def new
        if !logged_in?
            @user = User.new
        else
            redirect_to root_url
        end
    end

    # Creates a new user resource
    def create
        @user = User.new(user_params)
        if @user.save
            reset_session
            log_in @user
            redirect_to @user
            flash[:success] = "Successfully created."
        else
            flash.now[:danger] = "Could not create User"
            render 'new'
        end
    end

    # Fetch user matching id from db
    def edit
        @user = User.find(params[:id])
    end

    # Update a user resource with matching id
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Successfully updated"
            redirect_to @user
        else
            flash.now[:danger] = "Could not update your account"
            render 'edit'
        end
    end

    # Destroy user resource with matching id
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "Successfully deleted #{@user.name}"
        redirect_to root_url
    end

    private
        
        # Permit user input for name, email, password, and password_confirmation
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
        
        # Check if user matches requested user resource
        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_url) unless current_user?(@user)
        end
      
end
