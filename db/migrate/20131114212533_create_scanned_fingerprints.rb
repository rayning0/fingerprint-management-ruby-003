class CreateScannedFingerprints < ActiveRecord::Migration
  def change
    create_table :scanned_fingerprints do |t|
      t.integer :finger_print_scanner_id
      t.integer :finger_print_id
    end
    add_index :scanned_fingerprints, :finger_print_scanner_id
    add_index :scanned_fingerprints, :finger_print_id
  end
end
