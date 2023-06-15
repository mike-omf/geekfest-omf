# This migration comes from landable (originally 20200616204940)
class AddDataFieldsToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.visits", :user_name, :text
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.visits", :customer_id, :text
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.visits", :app_reference_number, :text
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.visits", :application_id, :text
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.visits", :branch_number, :text
  end
end
