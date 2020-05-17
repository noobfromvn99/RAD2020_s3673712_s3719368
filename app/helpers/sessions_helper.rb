module SessionsHelper
    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end
        # Returns the current logged-in user (if any).
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end
    
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    def logged_in_user?
        if (current_user == nil) 
            flash[:danger] = "Please login first"
            redirect_to root_url
        end
        
    end

    def current_user?(user)
        user==current_user
    end

    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

        # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:user_email] = params[:session][:email]
        cookies.permanent[:user_password] = params[:session][:password]
        cookies.permanent[:remember_token] = user.remember_token
    end

    def forget(user)
        cookies.delete(:user_id)
    end

    def get_avatar(user)
        if user.avatar?
            user.avatar.url
        else
            'deafult-avatar.jpg'
        end
    end
end
