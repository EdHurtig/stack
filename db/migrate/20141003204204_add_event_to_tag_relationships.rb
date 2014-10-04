class AddEventToTagRelationships < ActiveRecord::Migration
  def change
    add_column :tag_relationships, :event, :integer
  end
end
