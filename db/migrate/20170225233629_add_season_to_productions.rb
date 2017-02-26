class AddSeasonToProductions < ActiveRecord::Migration[5.0]
  def change
    add_column :productions, :season, :string
  end
end
