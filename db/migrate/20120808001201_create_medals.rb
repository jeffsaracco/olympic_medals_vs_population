class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.string :country
      t.integer :gold
      t.integer :silver
      t.integer :bronze
      t.integer :total

      t.timestamps
    end
  end
end
