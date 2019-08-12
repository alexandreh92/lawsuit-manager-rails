class Contact < ActiveRecord::Base
  belongs_to :profession
  belongs_to :marital_status
  belongs_to :lawyer

  #Validates

  validates :name, presence: true, length: {maximum: 50, minimum:3}
  validates :lastname, presence: true, length: {maximum: 50, minimum:3}
  validates :cpf, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  
  

  has_many :phones

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
