# This migration comes from landable (originally 20190321173716)
class AddIndexCreatedAtLandablePaths < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.paths", :created_at, algorithm: :concurrently
  end
end
