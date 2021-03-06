class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.references :area, null: false, foreign_key: true, type: :integer

      t.timestamps
    end
  end
end
