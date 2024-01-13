class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def index
    @users = User.all
    render ('pages/utilisateurs')
  end

  # Ajoutez d'autres actions personnalisées au besoin
end
