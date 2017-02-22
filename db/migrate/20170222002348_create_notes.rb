class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :rehearsal, foreign_key: true
      t.references :team, foreign_key: true
      t.string :content
      t.integer :status

      t.timestamps
    end
  end
end
