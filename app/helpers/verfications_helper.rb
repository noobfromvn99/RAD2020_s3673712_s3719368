module VerficationsHelper
    def get_user_verfication(user)
        if Verfication.find_by(user_id: user.id)
            Verfication.find_by(user_id: user.id)
        else
            Verfication.new
        end
    end
end
