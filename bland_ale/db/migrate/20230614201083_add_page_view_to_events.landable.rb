# This migration comes from landable (originally 20160610190854)
class AddPageViewToEvents < ActiveRecord::Migration[4.2]
  def up
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.events", :page_view_id, :integer
  end
end
