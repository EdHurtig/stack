class RenameSourceTypeToKind < ActiveRecord::Migration
  def change
    rename_column :sources, :type, :kind
  end
end
