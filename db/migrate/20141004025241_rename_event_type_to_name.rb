class RenameEventTypeToName < ActiveRecord::Migration
  def change

    rename_column :events, :type, :level

  end
end
