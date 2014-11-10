class ApplicationController < ActionController::Base
  # Require login to access any action
  before_filter :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do
    respond_to do |type|
      type.all  { render :nothing => true, :status => 404 }
    end
  end
end
