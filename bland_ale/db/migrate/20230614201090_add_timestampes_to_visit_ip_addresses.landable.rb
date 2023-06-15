# This migration comes from landable (originally 20180730192400)
class AddTimestampesToVisitIpAddresses < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.visit_ip_addresses ADD COLUMN created_at TIMESTAMPTZ;
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.visit_ip_addresses ADD COLUMN updated_at TIMESTAMPTZ;
    SQL
  end
end
