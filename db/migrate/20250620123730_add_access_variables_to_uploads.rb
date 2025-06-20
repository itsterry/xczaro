class AddAccessVariablesToUploads < ActiveRecord::Migration[8.0]
  def change
    add_column :uploads, :access_count, :integer, default: 0
    add_column :uploads, :last_accessed_at, :datetime
  end
end
