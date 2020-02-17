class AddTimestampToPosts < ActiveRecord::Migration[6.0]
  def change
      # Add new column but allow null values
      add_timestamps :posts, null: true

      # Backfill existing records with created_at and updated_at
      # values making clear that the records are faked (from testing)
      long_ago = DateTime.new(2000, 1, 1)
      Post.update_all(created_at: long_ago, updated_at: long_ago)

      # Change not null constraints
      change_column_null :posts, :created_at, false
      change_column_null :posts, :updated_at, false
  end
end
