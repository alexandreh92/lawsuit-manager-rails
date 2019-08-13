class Active < ActiveRecord::Base
  belongs_to :lawsuit
  belongs_to :contact
end