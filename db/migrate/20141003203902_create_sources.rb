class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :address
      t.integer :port
      t.string :type
      t.string :version

      t.timestamps
    end
  end
end
