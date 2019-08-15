class Reciever < ActiveRecord::Base
  belongs_to :lawsuit
  belongs_to :contact
end