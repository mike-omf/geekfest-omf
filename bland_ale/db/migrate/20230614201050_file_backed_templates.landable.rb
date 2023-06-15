# This migration comes from landable (originally 20140128170659)
class FileBackedTemplates < Landable::Migration
  def change
    change_table "#{Landable.configuration.database_schema_prefix}landable.templates" do |t|
      t.text    :file
      t.boolean :editable, default: true
    end
  end
end
