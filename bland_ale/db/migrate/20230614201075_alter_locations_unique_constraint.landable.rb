# This migration comes from landable (originally 20151020175438)
class AlterLocationsUniqueConstraint < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      ALTER TABLE #{Landable.configuration.database_schema_prefix}landable_traffic.locations
              DROP CONSTRAINT locations_country_id_region_id_city_id_key;
      CREATE UNIQUE INDEX locations_country_id_region_id_city_id_zip_code_id
              ON #{Landable.configuration.database_schema_prefix}landable_traffic.locations(country_id, region_id, city_id, zip_code_id);
    SQL
  end
end
