# This migration comes from landable (originally 20161018213546)
class AddCreatedByAuthorIdToPages < ActiveRecord::Migration[4.2]
  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable.pages", :created_by_author_id, :uuid
    add_foreign_key "#{Landable.configuration.database_schema_prefix}landable.pages", "#{Landable.configuration.database_schema_prefix}landable.authors", column: :created_by_author_id, primary_key: :author_id

    # Backfill created_by_author_id
    execute <<-SQL
      UPDATE #{Landable.configuration.database_schema_prefix}landable.pages
      SET created_by_author_id = updated_by_author_id;
    SQL
  end
end
