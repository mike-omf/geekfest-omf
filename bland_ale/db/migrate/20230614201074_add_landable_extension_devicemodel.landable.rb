# This migration comes from landable (originally 20151002145536)
class AddLandableExtensionDevicemodel < ActiveRecord::Migration[4.2]
  def change
    prefix = Landable.configuration.database_schema_prefix
    with_options schema: "#{prefix}landable_traffic" do
      create_lookup_table :extensions
      create_lookup_table :device_models
    end

    add_column "#{prefix}landable_traffic.attributions", :extension_id, :integer
    add_column "#{prefix}landable_traffic.attributions", :device_model_id, :integer

    execute <<-SQL
      ALTER TABLE #{prefix}landable_traffic.attributions
        ADD CONSTRAINT extension_id_fk
        FOREIGN KEY (extension_id)
        REFERENCES #{prefix}landable_traffic.extensions (extension_id);

      ALTER TABLE #{prefix}landable_traffic.attributions
        ADD CONSTRAINT device_model_id_fk
        FOREIGN KEY (device_model_id)
        REFERENCES #{prefix}landable_traffic.device_models (device_model_id);
    SQL
  end
end
