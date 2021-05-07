class CreateImprovements < ActiveRecord::Migration[5.2]
  def change
    create_table :improvements do |t|
      t.string :name
      t.text :description
      t.boolean :is_private
      t.float :estimated_effort
      t.float :actual_effort
      t.integer :status
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
