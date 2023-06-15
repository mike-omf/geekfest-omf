# This migration comes from landable (originally 20190321171804)
class AddCreatedAtPathsOwnersQueryStringsIpAddresses < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    execute <<-SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.query_strings ADD COLUMN created_at TIMESTAMPTZ DEFAULT now();
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.paths         ADD COLUMN created_at TIMESTAMPTZ DEFAULT now();
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.owners        ADD COLUMN created_at TIMESTAMPTZ DEFAULT now();
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.ownerships    ADD COLUMN created_at TIMESTAMPTZ DEFAULT now();
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.ip_addresses  ADD COLUMN created_at TIMESTAMPTZ DEFAULT now();
    SQL
  end
end
