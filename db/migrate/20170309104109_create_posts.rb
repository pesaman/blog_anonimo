class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
        t.string :title, null: true
        t.string :body, null: true
    end
  end
end
