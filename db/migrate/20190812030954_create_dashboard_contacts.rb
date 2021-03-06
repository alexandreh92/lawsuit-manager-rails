class CreateDashboardContacts < ActiveRecord::Migration
  def change
    create_table :dashboard_contacts do |t|
      t.string :name
      t.string :lastname
      t.string :cpf
      t.string :rg
      t.string :birthdate
      t.references :profession, index: true, foreign_key: true
      t.references :marital_status, index: true, foreign_key: true
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :district
      t.string :number

      t.timestamps null: false
    end
  end
end
