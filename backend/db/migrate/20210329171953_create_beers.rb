class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :malt_type
      t.integer :malt_amount
      t.string :hop_type
      t.integer :hop_amount
      t.string :yeast_type
      t.integer :yeast_amount
      t.integer :water_ph
      t.integer :water_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
