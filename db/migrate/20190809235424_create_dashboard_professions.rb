class CreateDashboardProfessions < ActiveRecord::Migration
  def change
    create_table :dashboard_professions do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
