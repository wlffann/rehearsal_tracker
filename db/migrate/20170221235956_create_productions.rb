class CreateProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :productions do |t|
      t.string :title
      t.string :logo_url
      t.references :company, foreign_key: true, index: true

      t.timestamps
    end
  end
end
