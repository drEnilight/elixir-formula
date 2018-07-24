class AddLanguageToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :language, :string, null: false
  end
end
