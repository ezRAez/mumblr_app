class CreateMumbles < ActiveRecord::Migration
  def change
    create_table :mumbles do |t|
      t.string     :text
      t.string     :image_uri
      t.string     :tags
      t.integer    :likes, default: 0
      t.references :user,  index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
