# This migration comes from landable (originally 20160527181953)
class AddReservedToIpAddresses < ActiveRecord::Migration[4.2]
  def up
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.ip_addresses", :reserved, :boolean
  end
end
