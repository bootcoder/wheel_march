class CreateRides < ActiveRecord::Migration[5.0]
  def change
    create_table :rides do |t|

      t.integer :max_seats
      t.integer :max_range

      t.string :start_point
      t.string :end_point

      t.datetime :start_time

      t.references :driver

      t.timestamps

    end
  end
end
