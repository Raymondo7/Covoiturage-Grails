class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.first_name = params[:user][:first_name]
      resource.last_name = params[:user][:last_name]
      resource.save
    end
  end
end
