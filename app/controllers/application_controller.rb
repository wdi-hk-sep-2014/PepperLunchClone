class ApplicationController < ActionController::Base
  # Require login to access any action
  before_filter :authenticate_user!

  # We have commented out this line to disable CSRF protection in order to simplify this example.
  # In general, this is a very bad idea since it exposes a security vulnerability.
  # See more: http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf

  # protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound do
    respond_to do |type|
      type.all  { render :nothing => true, :status => 404 }
    end
  end
end
