class ChangeFingerprintDatabaseId < ActiveRecord::Migration
  def change
    rename_column :fingerprints, :database_id, :fingerprint_database_id
  end
end
