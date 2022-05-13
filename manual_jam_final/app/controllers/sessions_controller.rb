class SessionsController < ApplicationController
  def destroy
      reset_session
      redirect_to root_path
    end

    def new
      @user = User.new
    end

    def create
      @user = User.find_by_email(params[:user][:email])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to :root
      else
        render :new, notice: 'Usuario o clave incorrecto'
      end
    end
  end
