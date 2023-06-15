# This migration comes from landable (originally 20181116175913)
class AddUpdatedAtToLandableTrafficUserAgent < ActiveRecord::Migration[5.1]
  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.user_agents", :updated_at, :timestamptz
  end
end
