# frozen_string_literal: true

class Lawsuit < ActiveRecord::Base
  belongs_to :forum
  belongs_to :lawyer

  has_many :actives, class_name: 'Contact'
  has_many :passives, class_name: 'Contact'

  accepts_nested_attributes_for :actives, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :passives, reject_if: :all_blank, allow_destroy: true
end
