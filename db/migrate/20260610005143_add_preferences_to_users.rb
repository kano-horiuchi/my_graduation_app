class AddPreferencesToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :fruity_level, :integer, default: 3
    add_column :users, :dry_level, :integer, default: 3
    add_column :users, :rich_level, :integer, default: 3
  end
end
