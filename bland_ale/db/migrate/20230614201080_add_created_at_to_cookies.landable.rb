# This migration comes from landable (originally 20151214224627)
class AddCreatedAtToCookies < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      ALTER TABLE #{landable_cookies_table} ADD COLUMN created_at TIMESTAMPTZ;
      ALTER TABLE #{landable_cookies_table} ALTER COLUMN created_at SET DEFAULT now();
    SQL
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end

  private

  def landable_cookies_table
    "#{Landable.configuration.database_schema_prefix}landable_traffic.cookies"
  end
end
