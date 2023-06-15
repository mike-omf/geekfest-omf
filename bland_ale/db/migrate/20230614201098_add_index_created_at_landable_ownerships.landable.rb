# This migration comes from landable (originally 20190321173907)
class AddIndexCreatedAtLandableOwnerships < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.ownerships", :created_at, algorithm: :concurrently
  end
end
