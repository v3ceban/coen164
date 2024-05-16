class RootController < ApplicationController
  def main
    redirect_to controller: 'access', action: 'login'
  end
end
