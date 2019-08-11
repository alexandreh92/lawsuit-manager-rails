# frozen_string_literal: true

class AddLawsuitToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :lawsuit_id, :integer
  end
end
