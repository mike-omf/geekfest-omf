# This migration comes from landable (originally 20150921160458)
class AddPageViewVisitSequenceNumber < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.page_views ADD COLUMN visit_sequence_number int;
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.page_views ADD COLUMN updated_at TIMESTAMPTZ;
    SQL
  end
end
