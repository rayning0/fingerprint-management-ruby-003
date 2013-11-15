class CreateFingerprintScanners < ActiveRecord::Migration
  def change
    create_table :fingerprint_scanners do |t|
      t.string :location
    end
  end
end
