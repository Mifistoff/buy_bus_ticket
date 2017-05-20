class CreateBusStops < ActiveRecord::Migration[5.1]
  def change
    create_table :bus_stops do |t|
      t.integer :number
      t.string :name
      t.time :arrival_time
      t.references :bus, foreign_key: true

      t.timestamps
    end
  end
end
