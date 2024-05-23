class NewAccessController < ApplicationController
  def login
  end

  def authenticate
    # p [params[:userid],  params[:password]]
    if params[:userid] == 'yuan' && params[:password] == '123'
      render(:welcome)
    else
      flash[:notice] = 'login failed'
      redirect_to '/new_access/login' # had to change this to /access/login from /login
    end
  end

  def logout
    flash[:notice] = 'logged out'
    redirect_to '/new_access/login'
  end
end
