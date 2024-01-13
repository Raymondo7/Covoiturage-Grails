class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
    # Personnalisez le chemin de redirection après la déconnexion
    root_path
  end
end
