class AddTakenAtToFingerprints < ActiveRecord::Migration
  def change
    add_column :fingerprints, :taken_at, :datetime
  end
end
