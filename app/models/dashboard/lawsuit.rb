# frozen_string_literal: true

class Dashboard::Lawsuit < ActiveRecord::Base
  belongs_to :forum
  belongs_to :lawyer
  has_many :actives
  has_many :contacts, through: :actives
  has_many :recievers
  has_many :contacts, through: :recievers

  #Validations
  validates :autos, :lawyer, :fees, :forum, presence: true

  accepts_nested_attributes_for :actives, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :recievers, reject_if: :all_blank, allow_destroy: true

  def start_time
    self.conciliation_date
  end


end
