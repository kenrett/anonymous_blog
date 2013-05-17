class Posts < ActiveRecord::Migration
  
  def change
    create_table :posts do |t|
      t.string :body
      t.string :title
    end
  end
end
