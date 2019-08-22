class CreateDashboardActives < ActiveRecord::Migration
  def change
    create_table :dashboard_actives do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :lawsuit, index: true
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
