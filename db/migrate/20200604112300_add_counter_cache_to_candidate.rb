class AddCounterCacheToCandidate < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :votelogs_count, :integer, default: 0
  end
end
