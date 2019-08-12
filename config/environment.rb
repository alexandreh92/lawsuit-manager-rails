# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActiveRecord::Base.include_root_in_json = true
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end