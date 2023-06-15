# This migration comes from landable (originally 20190318190542)
class AddVisitChangeReasons < ActiveRecord::Migration[5.1]
  def change
    prefix = Landable.configuration.database_schema_prefix
    with_options schema: "#{prefix}landable_traffic" do
      create_lookup_table :new_visit_reasons
    end

    add_column "#{prefix}landable_traffic.visits", :new_visit_reason_id, :integer
  end
end
