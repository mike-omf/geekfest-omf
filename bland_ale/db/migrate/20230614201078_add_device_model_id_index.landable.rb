# This migration comes from landable (originally 20151113033710)
class AddDeviceModelIdIndex < ActiveRecord::Migration[4.2]
  disable_ddl_transaction!

  def up
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.user_agents", :device_model_id, algorithm: :concurrently
  end
end
