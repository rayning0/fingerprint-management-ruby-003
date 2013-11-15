class CreateFingerprints < ActiveRecord::Migration
  def change
    create_table :fingerprints do |t|
      t.integer :database_id
      t.integer :person_id
      t.string :fingerprint_image_url
    end
    add_index :fingerprints, :database_id
    add_index :fingerprints, :person_id
  end
end
