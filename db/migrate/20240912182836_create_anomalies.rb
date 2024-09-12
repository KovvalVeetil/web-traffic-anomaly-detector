class CreateAnomalies < ActiveRecord::Migration[7.1]
  def change
    create_table :anomalies do |t|
      t.string :ip_address
      t.string :anomaly_type
      t.datetime :detected_at
      t.text :details

      t.timestamps
    end
  end
end
