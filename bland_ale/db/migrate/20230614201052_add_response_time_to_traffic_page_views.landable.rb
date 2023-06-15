# This migration comes from landable (originally 20140206211322)
class AddResponseTimeToTrafficPageViews < ActiveRecord::Migration[4.2]
  def change
    change_table "#{Landable.configuration.database_schema_prefix}landable_traffic.page_views" do |t|
      t.column :response_time, :integer
    end
  end
end
