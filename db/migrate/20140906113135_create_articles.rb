class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :tags
      t.integer :status

      t.timestamps
    end
  end
end
