class AddEmailToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :email, :string
  end
end
