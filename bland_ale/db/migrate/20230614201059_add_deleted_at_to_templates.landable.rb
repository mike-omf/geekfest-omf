# This migration comes from landable (originally 20140501171406)
class AddDeletedAtToTemplates < ActiveRecord::Migration[4.2]
  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable.templates", :deleted_at, :timestamp
  end
end
