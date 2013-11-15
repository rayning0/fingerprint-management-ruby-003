class CreateCriminalHistories < ActiveRecord::Migration
  def change
    create_table :criminal_histories do |t|
      t.integer :person_id
      t.string :incident_type
    end
    add_index :criminal_histories, :person_id
  end
end
