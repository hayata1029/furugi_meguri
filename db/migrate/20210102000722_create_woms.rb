class CreateWoms < ActiveRecord::Migration[6.0]
  def change
    create_table :woms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.text :content
      t.string :title
      t.float :rate
      t.date :visit_date

      t.timestamps
    end
  end
end
