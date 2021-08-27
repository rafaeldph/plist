class CreateApiLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :api_logs do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
