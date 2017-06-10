class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :vehicle, foreign_key: true
      t.decimal :total_price
      t.string :plate_number

      t.timestamps
    end
  end
end
