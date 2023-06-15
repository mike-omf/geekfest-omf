# This migration comes from landable (originally 20151112160217)
class CreateLandableTrafficIsps < ActiveRecord::Migration[4.2]
  def change
    create_table "#{Landable.configuration.database_schema_prefix}landable_traffic.isps" do |t|
      t.string :isp
    end

    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.ip_lookups", :isp_id, :integer
    add_foreign_key "#{Landable.configuration.database_schema_prefix}landable_traffic.ip_lookups", "#{Landable.configuration.database_schema_prefix}landable_traffic.isps", column: :isp_id
  end
end
