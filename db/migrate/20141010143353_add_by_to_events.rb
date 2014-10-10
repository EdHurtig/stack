class AddByToEvents < ActiveRecord::Migration
  def change
    add_column :events, :by, :string
  end
end
