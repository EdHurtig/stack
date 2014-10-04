class CreateTagRelationships < ActiveRecord::Migration
  def change
    create_table :tag_relationships do |t|

      t.timestamps
    end
  end
end
