class CreateDashboardLawsuits < ActiveRecord::Migration
  def change
    create_table :dashboard_lawsuits do |t|
      t.references :forum, index: true, foreign_key: true
      t.references :lawyer, index: true, foreign_key: true
      t.decimal :fees
      t.string :autos
      t.datetime :conciliation_date
      t.datetime :instruction_date
      t.datetime :interrogation_date


      t.timestamps null: false
    end
  end
end
