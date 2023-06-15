# This migration comes from landable (originally 20200317152612)
class AddTimestampsToEventTypes < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.event_types", :created_at, 'TIMESTAMPTZ'
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.event_types", :updated_at, 'TIMESTAMPTZ'

    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.event_types", :created_at, algorithm: :concurrently
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.event_types", :updated_at, algorithm: :concurrently

    execute <<~SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.event_types ALTER created_at SET DEFAULT now();
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.event_types ALTER updated_at SET DEFAULT now();
    SQL
  end
end
