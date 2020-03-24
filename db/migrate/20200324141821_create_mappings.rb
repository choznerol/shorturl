class CreateMappings < ActiveRecord::Migration[6.0]
  def change
    create_table :mappings do |t|
      t.string :key, null: false, index: { unique: true }
      t.string :target_url, null: false

      t.timestamps
    end
  end
end
