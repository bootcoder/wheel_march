class CreatePassengerRides < ActiveRecord::Migration[5.0]
  def change
    create_table :passenger_rides do |t|

      t.string :pickup_address

      t.references :passenger
      t.references :ride

      t.timestamps

    end
  end
end
