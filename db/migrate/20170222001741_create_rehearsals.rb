class CreateRehearsals < ActiveRecord::Migration[5.0]
  def change
    create_table :rehearsals do |t|
      t.references :production, foreign_key: true
      t.string :date
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
