class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :emotion_id
      t.string :content

      t.timestamps
    end
  end
end
