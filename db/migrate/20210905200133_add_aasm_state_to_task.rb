class AddAasmStateToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :prioritize, :string
    add_column :tasks, :progress, :string
    add_index  :tasks, :prioritize
    add_index  :tasks, :progress
  end
end
