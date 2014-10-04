class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :name
      t.string :data
      t.integer :event

      t.timestamps
    end
  end
end
