class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :category
      t.boolean :available, default: true
      t.integer :user_id
      t.integer :review_id
      t.timestamps
    end
  end
end
