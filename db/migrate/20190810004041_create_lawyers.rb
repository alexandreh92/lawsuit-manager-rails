class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
