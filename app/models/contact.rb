class Contact < ActiveRecord::Base
  attr_accessor :active_ids
  belongs_to :profession
  belongs_to :marital_status
  has_many :actives
  has_many :lawsuits, through: :actives
  has_many :recievers
  has_many :lawsuits, through: :recievers


  #Validates

  validates :name, presence: true, length: {maximum: 50, minimum:3}
  validates :lastname, presence: true, length: {maximum: 50, minimum:3}
  validates :cpf, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}

  has_many :phones

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true


  def fullname
    "#{name} #{lastname}"
  end
  

end
