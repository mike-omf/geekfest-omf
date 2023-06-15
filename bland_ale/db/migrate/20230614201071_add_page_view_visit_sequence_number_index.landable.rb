# This migration comes from landable (originally 20150921162206)
class AddPageViewVisitSequenceNumberIndex < ActiveRecord::Migration[4.2]
  disable_ddl_transaction!

  def up
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.page_views", :visit_sequence_number, name: "#{Landable.configuration.database_schema_prefix}index_dummy_landable_traffic.page_views_visit_seq_num", algorithm: :concurrently
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.page_views", :updated_at, algorithm: :concurrently
  end
end
