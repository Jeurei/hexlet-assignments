class RenameStatusToAasmState < ActiveRecord::Migration[7.2]
  def change
    rename_column :vacancies, :status, :aasm_state
  end
end
