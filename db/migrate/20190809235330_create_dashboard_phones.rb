class CreateDashboardPhones < ActiveRecord::Migration
  def change
    create_table :dashboard_phones do |t|
      t.string :number
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
