class CreateDashboardDummies < ActiveRecord::Migration
  def change
    create_table :dashboard_dummies do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
