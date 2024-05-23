class RootController < ApplicationController
  def main
    # redirect_to controller: 'access', action: 'login'
    redirect_to '/access/login'
  end
end
