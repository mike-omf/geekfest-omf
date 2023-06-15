# This migration comes from landable (originally 20180119194436)
class AddUsernameToPageView < ActiveRecord::Migration[4.2]
  def up
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.page_views", :owner_id, :integer
  end
end
