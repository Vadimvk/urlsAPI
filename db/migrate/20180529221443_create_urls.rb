class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.belongs_to :user, index: true
      t.text :urls, :null => false
      t.string :short_url, :null => false
      t.integer :count

      t.timestamps
    end

    add_index :urls, :short_url, unique: true
  end
end
