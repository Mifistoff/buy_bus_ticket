class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.integer :number_of_tickets
      t.string :departure
      t.datetime :departure_time
      t.string :destination
      t.datetime :destination_time

      t.timestamps
    end
  end
end
