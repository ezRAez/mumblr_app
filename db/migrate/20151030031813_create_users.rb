class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,             null:    false
      t.string :handle,            default: "anonymous"
      t.string :profile_image_uri
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
