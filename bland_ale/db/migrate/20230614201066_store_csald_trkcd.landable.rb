# This migration comes from landable (originally 20150401211039)
class StoreCsaldTrkcd < ActiveRecord::Migration[4.2]
  def up
    with_options schema: "#{Landable.configuration.database_schema_prefix}landable_traffic" do
      create_lookup_table :trkcds
      create_lookup_table :cscalds
    end

    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.attributions", :trkcd_id, :integer
    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.attributions", :cscald_id, :integer

    execute <<-SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.attributions
        ADD CONSTRAINT trkcd_id_fk
        FOREIGN KEY (trkcd_id)
        REFERENCES #{Landable.configuration.database_schema_prefix}landable_traffic.trkcds (trkcd_id);

      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.attributions
        ADD CONSTRAINT cscald_id_fk
        FOREIGN KEY (cscald_id)
        REFERENCES #{Landable.configuration.database_schema_prefix}landable_traffic.cscalds (cscald_id);
    SQL
  end
end
