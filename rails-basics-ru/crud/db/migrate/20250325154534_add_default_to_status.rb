class AddDefaultToStatus < ActiveRecord::Migration[7.2]
  def change
    change_column :tasks, :status, :string, default: 'new'
  end
end
