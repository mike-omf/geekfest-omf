# This migration comes from landable (originally 20151112175730)
class AddUserAgentDeviceModelId < ActiveRecord::Migration[4.2]
  def up
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.user_agents", :device_model_id, :integer, limit: 2

    execute <<-SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.user_agents ADD FOREIGN KEY (device_model_id) REFERENCES #{Landable.configuration.database_schema_prefix}landable_traffic.device_models(device_model_id);
    SQL
  end
end
