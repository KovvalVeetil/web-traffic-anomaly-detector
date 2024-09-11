class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.string :ip_address
      t.string :path
      t.integer :status_code
      t.datetime :timestamp

      t.timestamps
    end
  end
end
