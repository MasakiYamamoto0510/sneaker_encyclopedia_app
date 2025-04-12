class CreateSneakerCommentFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :sneaker_comment_favorites do |t|

      t.references :sneaker_comment, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
