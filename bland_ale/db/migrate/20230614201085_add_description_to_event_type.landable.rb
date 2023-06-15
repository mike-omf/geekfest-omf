# This migration comes from landable (originally 20161006180741)
class AddDescriptionToEventType < ActiveRecord::Migration[4.2]
  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.event_types", :description, :text
  end
end
