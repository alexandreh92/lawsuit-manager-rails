class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
end
