module SessionsHelper

    # Logs the user in
    def log_in(user)
        session[:user_id] = user.id 
    end

    # Check if user is already logged in
    def logged_in?
        !current_user.nil?
    end

    # Logs the user out
    def log_out
        reset_session
        @current_user = nil
    end

    # 
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end  
    end

    # 
    def current_user?(user)
        user && user == current_user
    end

end
