class CreateBlockTable < ActiveRecord::Migration[7.1]
  def change
    create_table :blocks do |t|
      t.string  :previous_hash
      t.integer :timestamp, null: false
      t.json    :data, default: {}
      t.string  :current_hash, null: false

      t.timestamps
    end
  end
end
