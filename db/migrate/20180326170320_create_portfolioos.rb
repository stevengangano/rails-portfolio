class CreatePortfolioos < ActiveRecord::Migration
  def change
    create_table :portfolioos do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :main_image
      t.string :thumb_image

      t.timestamps null: false
    end
  end
end
