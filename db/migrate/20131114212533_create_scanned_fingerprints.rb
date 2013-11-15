class CreateScannedFingerprints < ActiveRecord::Migration
  def change
    create_table :scanned_fingerprints do |t|
      t.integer :fingerprint_scanner_id
      t.integer :fingerprint_id
    end
    add_index :scanned_fingerprints, :fingerprint_scanner_id
    add_index :scanned_fingerprints, :fingerprint_id
  end
end
