class CreateVotelogs < ActiveRecord::Migration[6.0]
  def change
    create_table :votelogs do |t|
      t.references :candidate, null: false, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
