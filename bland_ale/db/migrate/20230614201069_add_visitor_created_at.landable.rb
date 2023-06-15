# This migration comes from landable (originally 20150821031528)
class AddVisitorCreatedAt < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.visitors ADD COLUMN created_at TIMESTAMPTZ;
    SQL
  end
end
