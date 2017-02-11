class CreateDriverDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :driver_details do |t|

      t.string :make
      t.string :model
      t.string :tag

      t.references :driver

      t.timestamps

    end
  end
end
