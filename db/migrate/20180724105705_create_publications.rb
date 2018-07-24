class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :tags, array: true, default: []
    end
  end
end
