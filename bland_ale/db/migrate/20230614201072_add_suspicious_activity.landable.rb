# This migration comes from landable (originally 20150924190857)
class AddSuspiciousActivity < ActiveRecord::Migration[4.2]
  def up
    with_options schema: "#{Landable.configuration.database_schema_prefix}landable_traffic", small: true do
      create_lookup_table :suspicious_activity_types
    end

    create_join_table :visitors, :suspicious_activity_types, table_name: "#{Landable.configuration.database_schema_prefix}landable_traffic.suspicious_activities" do |t|
      t.integer :visitor_id
      t.integer :suspicious_type_id
      t.index :visitor_id, name: 'suspicious_activities_by_visitor'
      t.index :suspicious_type_id, name: 'suspicious_activities_by_suspicious_activity_type'
    end
  end
end
