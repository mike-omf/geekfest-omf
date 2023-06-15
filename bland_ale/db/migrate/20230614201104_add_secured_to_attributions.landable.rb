# This migration comes from landable (originally 20191204174539)
class AddSecuredToAttributions < ActiveRecord::Migration[5.2]
  def change
    create_table "#{Landable.configuration.database_schema_prefix}landable_traffic.secured_flags", primary_key: :secured_flag_id do |t|
      t.string :secured_flag
    end

    add_reference "#{Landable.configuration.database_schema_prefix}landable_traffic.attributions", :secured_flag
  end
end
