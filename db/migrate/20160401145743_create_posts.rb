class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link_url
      t.string :format
      t.datetime :written_at
      t.timestamps null: false
    end
  end
end
