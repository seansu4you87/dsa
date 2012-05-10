class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.boolean :private
      t.boolean :published

      t.timestamps
    end
  end
end
