# frozen_string_literal: true

class CreateUrls < ActiveRecord::Migration[6.1]
  def up
    create_table :urls do |t|
      t.string :short_url, null: false
      t.string :original_url, null: false
      t.integer :visited, default: 0
      t.timestamps
    end

    add_index :urls, :short_url, unique: true
  end

  def down
    drop_table :urls
  end
end
