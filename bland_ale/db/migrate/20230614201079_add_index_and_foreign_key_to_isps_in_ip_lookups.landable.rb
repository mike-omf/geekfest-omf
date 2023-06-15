# This migration comes from landable (originally 20151118152121)
class AddIndexAndForeignKeyToIspsInIpLookups < ActiveRecord::Migration[4.2]
  disable_ddl_transaction!
  def change
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.ip_lookups", :isp_id, algorithm: :concurrently
  end
end
