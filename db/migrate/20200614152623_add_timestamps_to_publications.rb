class AddTimestampsToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :created_at, :datetime
    add_column :publications, :updated_at, :datetime
  end
end
