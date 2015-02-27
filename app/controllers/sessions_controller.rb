class SessionsController < ApplicationController
  layout false
  skip_before_action :require_user
 
  def create
    # Do authentication is there a user with this email and is the password correct
    user = User.find_by(email: params["email"])
    
    # ---- Alternative if you want to confirm both at the same time
    # if user && user.password == params["password"] 
    #   render text: "GREAT!"
    # else
    #   render text: "Nope - you fail"
    # end

    if user
      if user.authenticate(params["password"])
        session["user_id"] = user.id
        redirect_to root_path, notice: "GREAT! You're in the Secret Place!"
      else
        redirect_to root_path, alert: "Nope - you fail due to password"
      end
    
    else
      redirect_to root_path, alert: "Nope - you fail due to username"
    end
    
  end

  def destroy
    # Do sign-out
    session["user_id"] = nil
    redirect_to root_path, notice: "See ya Later!"
  end

end