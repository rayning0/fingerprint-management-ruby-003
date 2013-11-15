class RenameFingerprintScannerIdInScannedFingerprints < ActiveRecord::Migration
  def change
    remove_index :scanned_fingerprints, :finger_print_scanner_id
    rename_column :scanned_fingerprints, :finger_print_scanner_id, :fingerprint_scanner_id
    add_index :scanned_fingerprints, :fingerprint_scanner_id
  end
end
