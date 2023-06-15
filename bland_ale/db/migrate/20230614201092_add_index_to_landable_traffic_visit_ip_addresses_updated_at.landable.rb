# This migration comes from landable (originally 20190115040108)
class AddIndexToLandableTrafficVisitIpAddressesUpdatedAt < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.visit_ip_addresses", :updated_at, algorithm: :concurrently
  end
end
