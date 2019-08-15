class CreateRecievers < ActiveRecord::Migration
  def change
    create_table :recievers do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :lawsuit, index: true
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
