class CreateTableComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :serial_number
      t.string :user_name
      t.string :message
      t.timestamps
    end
  end
end
