class CreateDashboardMaritalStatuses < ActiveRecord::Migration
  def change
    create_table :dashboard_marital_statuses do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
