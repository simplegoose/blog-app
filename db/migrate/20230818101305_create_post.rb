class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :text
      t.string :title
      t.integer :likes_counter
      t.integer :comment__counter
      t.references :author, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
