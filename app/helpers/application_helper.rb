module ApplicationHelper
	def admin?
    if (User.find session[:user_id]).role =="Admin" 
       true
    end
  end

  def financier?
    if (User.find session[:user_id]).role == "Financier"
       true
    end
  end

   def user?
    if (User.find session[:user_id]).role == "User"
       true
    end
  end
end
