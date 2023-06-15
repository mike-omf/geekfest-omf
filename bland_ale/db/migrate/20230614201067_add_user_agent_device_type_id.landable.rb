# This migration comes from landable (originally 20150819155730)
class AddUserAgentDeviceTypeId < ActiveRecord::Migration[4.2]
  def up
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.user_agents", :device_type_id, :integer, limit: 2

    execute <<-SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.user_agents ADD FOREIGN KEY (device_type_id) REFERENCES #{Landable.configuration.database_schema_prefix}landable_traffic.device_types(device_type_id);
    SQL
  end
end
