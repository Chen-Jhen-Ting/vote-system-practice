class DeleteWrong < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :votelogs_count, :integer, default: 0

    remove_column :candidates, :vote_logs_count
  end
end
