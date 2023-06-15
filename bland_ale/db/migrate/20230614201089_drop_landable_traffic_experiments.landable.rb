# This migration comes from landable (originally 20180509203129)
class DropLandableTrafficExperiments < ActiveRecord::Migration[5.1]
  def change
    remove_column "#{Landable.configuration.database_schema_prefix}landable_traffic.attributions", :experiment_id, :integer
    drop_table "#{Landable.configuration.database_schema_prefix}landable_traffic.experiments"
  end
end
