class AddAasmStateToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :prioritize, :string
    add_index  :tasks, :prioritize
  end
end
