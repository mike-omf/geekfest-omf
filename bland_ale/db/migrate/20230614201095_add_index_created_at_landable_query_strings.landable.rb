# This migration comes from landable (originally 20190321173406)
class AddIndexCreatedAtLandableQueryStrings < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.query_strings", :created_at, algorithm: :concurrently
  end
end
