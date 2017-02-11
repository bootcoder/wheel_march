class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|

      t.string :status
      t.string :code

      t.references :driver
      t.references :new_driver

      t.timestamps

    end
  end
end
