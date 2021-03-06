class SessionsController < ApplicationController
  @@allowed_users = [ "kaushalye@gmail.com", 
                      "indikamee@gmail.com",
                      "nishantha.rajapakshe@gmail.com",
                      "dassa.dml@gmail.com",
                      "marasinghe@gmail.com",
                      "rasika.amarasiri@gmail.com",
                      "susantha.liyanage@gmail.com",
                      "randykaru@gmail.com",
                      "des.fdo@gmail.com"
                    ]
  def create
    #@user=User.from_omniauth(request.env['omniauth.auth'])
    #puts @user.email
    #render text: request.env['omniauth.auth'].to_yaml
    begin
      @resp = request.env['omniauth.auth']
      @user = User.where(["provider = :p and uid=:uid", { p: @resp.provider, uid: @resp.uid}]).first
      
      # Seems to have some problem with oauth library. TODO::upgrade gem  
      #@user = User.from_omniauth(request.env['omniauth.auth'])
      
      if @@allowed_users.include? @user.email
        session[:user_id] = @user.id
        session[:user_email] = @user.email
        redirect_to root_path, :flash => { :success => "Welcome, #{@user.name}!" }
      else
        redirect_to root_path, :flash => { :warning => "This is bad ! You are not authorized to access this page. Please contact the admin." }
      end

    rescue
      redirect_to root_path, :flash => { :warning => "There was an error while trying to authenticate you. Please contact the admin."}
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      session.delete(:user_email)
      flash[:success] = 'See you later!'
    end
    redirect_to root_path
  end

end