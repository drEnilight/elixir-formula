class AddStatusToPublication < ActiveRecord::Migration[5.2]
  def up
    add_column :publications, :status, :string, default: 'pending', null: false

    execute %{
      UPDATE publications SET status = 'published';
    }
  end

  def down
    remove_column :publications, :status
  end
end
