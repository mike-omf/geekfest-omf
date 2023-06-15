# This migration comes from landable (originally 20161116203429)
class AddUpdatedAtToEvent < ActiveRecord::Migration[4.2]
  def change
    execute <<-SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.events ADD COLUMN updated_at TIMESTAMPTZ;
    SQL
  end
end
