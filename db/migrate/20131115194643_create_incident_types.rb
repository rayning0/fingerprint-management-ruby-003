class CreateIncidentTypes < ActiveRecord::Migration
  def up
    create_table :incident_types do |t|
      t.string :name
    end

    add_column :criminal_histories, :incident_type_id, :integer
    add_index :criminal_histories, :incident_type_id

    remove_column :criminal_histories, :incident_type
  end

  def down
    drop_table :incident_types
    remove_column :criminal_histories, :incident_type_id
    add_column :criminal_histories, :incident_type, :string
  end
end
