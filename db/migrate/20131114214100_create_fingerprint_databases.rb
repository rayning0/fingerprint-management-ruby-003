class CreateFingerprintDatabases < ActiveRecord::Migration
  def change
    create_table :fingerprint_databases do |t|
      t.string :name
      t.string :owner
    end
  end
end
