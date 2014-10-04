class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.string :type
      t.integer :source

      t.timestamps
    end
  end
end
