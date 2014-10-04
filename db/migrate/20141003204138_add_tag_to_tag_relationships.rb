class AddTagToTagRelationships < ActiveRecord::Migration
  def change
    add_column :tag_relationships, :tag, :integer
  end
end
