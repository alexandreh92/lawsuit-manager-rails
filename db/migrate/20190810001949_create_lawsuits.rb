class CreateLawsuits < ActiveRecord::Migration
  def change
    create_table :lawsuits do |t|
      t.references :forum, index: true, foreign_key: true
      t.references :lawyer, index: true, foreign_key: true
      t.decimal :fees
      t.string :autos
      t.string :conciliation_date
      t.string :instruction_date
      t.references :active, index: true, foreign_key: true
      t.references :passive, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
