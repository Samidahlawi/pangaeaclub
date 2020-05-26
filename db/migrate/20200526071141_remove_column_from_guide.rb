class RemoveColumnFromGuide < ActiveRecord::Migration[6.0]
  def change
    remove_column :guides, :profile_image
  end
end
