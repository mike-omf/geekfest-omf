# This migration comes from landable (originally 20190916212307)
class CreateLandableEventTypeTags < ActiveRecord::Migration[5.2]
  def change
    create_table "#{Landable.configuration.database_schema_prefix}landable_traffic.event_type_tags", primary_key: :event_type_tag_id do |t|
      t.references :event_type, index: { name: 'landable_traffic.event_type_tags_event_types_idx' }
      t.references :tag, index: { name: 'landable_traffic.event_type_tags_tags_idx' }
      t.timestamps
    end

    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.event_type_tags", %i[event_type_id tag_id], unique: true, name: 'landable_traffic.event_type_tags_on_event_type_id_and_tag_id'
  end
end
