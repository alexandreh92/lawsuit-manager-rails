# frozen_string_literal: true

class Lawsuit < ActiveRecord::Base
  belongs_to :forum
  belongs_to :lawyer
  has_many :actives
  has_many :contacts, through: :actives
  
  accepts_nested_attributes_for :actives, allow_destroy: true

end
