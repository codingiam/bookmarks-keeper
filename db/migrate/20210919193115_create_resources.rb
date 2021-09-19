class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.text :url, limit: 2048, null: false
      t.string :state, null: false

      t.timestamps
    end
    add_index :resources, :url, unique: true
    add_index :resources, :state
  end
end
