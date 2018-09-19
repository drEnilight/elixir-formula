class AddAuthorNameToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :author_name, :string
  end
end
