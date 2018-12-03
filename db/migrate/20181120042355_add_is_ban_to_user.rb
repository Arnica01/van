class AddIsBanToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_ban, :boolean
  end
end
