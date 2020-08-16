class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :image, null: false
      t.string :nickname, null: false
      t.string :location
      t.boolean :admin, default: false, null: false
    end
  end
end
