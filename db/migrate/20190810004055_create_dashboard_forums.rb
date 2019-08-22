class CreateDashboardForums < ActiveRecord::Migration
  def change
    create_table :dashboard_forums do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
