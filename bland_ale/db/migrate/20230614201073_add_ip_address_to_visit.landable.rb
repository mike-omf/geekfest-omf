# This migration comes from landable (originally 20151001181624)
class AddIpAddressToVisit < ActiveRecord::Migration[4.2]
  def up
    create_table "#{Landable.configuration.database_schema_prefix}landable_traffic.visit_ip_addresses", primary_key: :visit_ip_address_id do |t|
      t.integer :visit_id
      t.integer :ip_address_id
      t.integer :ip_lookup_id
      t.index   :visit_id, name: 'visit_ip_addresses_by_visit'
      t.index   :ip_address_id, name: 'visit_ip_addresses_by_ip_address'
      t.index   :ip_lookup_id, name: 'visit_ip_addresses_by_ip_lookup'
    end

    create_table "#{Landable.configuration.database_schema_prefix}landable_traffic.zip_codes", primary_key: :zip_code_id do |t|
      t.text :zip_code
    end

    add_column "#{Landable.configuration.database_schema_prefix}landable_traffic.locations", :zip_code_id, :integer

    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.locations", :zip_code_id

    remove_column "#{Landable.configuration.database_schema_prefix}landable_traffic.ip_lookups", :ip_address_id
  end
end
