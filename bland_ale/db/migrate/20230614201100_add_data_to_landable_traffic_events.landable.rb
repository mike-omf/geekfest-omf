# This migration comes from landable (originally 20190613153551)
class AddDataToLandableTrafficEvents < ActiveRecord::Migration[5.2]
  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.events", :data, :jsonb
  end
end
