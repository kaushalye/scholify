class SessionsController < ApplicationController
  @@allowed_users = [ "kaushalye@gmail.com", 
                      "indikamee@gmail.com",
                      "nishantha.rajapakshe@gmail.com",
                      "dassa.dml@gmail.com",
                      "marasinghe@gmail.com",
                      "rasika.amarasiri@gmail.com",
                      "susantha.liyanage@gmail.com",
                      "des.fdo@gmail.com"
                    ]
  def create
    #render text: request.env['omniauth.auth'].to_yaml
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      
      if @@allowed_users.include? @user.email
        session[:user_id] = @user.id
        redirect_to root_path, :flash => { :success => "Welcome, #{@user.name}!" }
      else
        redirect_to root_path, :flash => { :warning => "This is bad ! You are not authorized to access this page. Please contact the admin." }
      end

    rescue
      redirect_to root_path, :flash[:warning] = "There was an error while trying to authenticate you. Please contact the admin."
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you later!'
    end
    redirect_to root_path
  end

end