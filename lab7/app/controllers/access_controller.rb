class AccessController < ApplicationController
  def login; end

  def authenticate
    # p [params[:userid],  params[:password]]
    @userid = params[:userid]
    @password =	params[:password]
    if params[:userid] == 'yuan' && params[:password] == '123'
      render(:welcome)
    else
      flash[:notice] = 'login failed'
      redirect_to '/login'
    end
  end

  def logout
    flash[:notice] = 'logged out'
    redirect_to '/access/login'
  end
end
