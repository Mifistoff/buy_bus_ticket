class CreateBusTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :number
      t.integer :availability
      t.references :bus, foreign_key: true

      t.timestamps
    end
  end
end
