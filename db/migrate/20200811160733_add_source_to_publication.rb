class AddSourceToPublication < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :source, :string
  end
end
