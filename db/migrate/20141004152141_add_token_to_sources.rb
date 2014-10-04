class AddTokenToSources < ActiveRecord::Migration
  def change
    add_column :sources, :token, :string
  end
end
