# frozen_string_literal: true

class Contact < ActiveRecord::Base
  belongs_to :profession
  belongs_to :lawsuit
  belongs_to :marital_status
  belongs_to :lawsuit
  has_many :phones

  # Validations
  validates :name, presence: true, length: { minimum: 3 }
  #validates :cpf, presence: true

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
