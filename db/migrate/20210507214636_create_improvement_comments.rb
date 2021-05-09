class CreateImprovementComments < ActiveRecord::Migration[5.2]
  def change
    create_table :improvement_comments do |t|
      t.text :body
      t.references :user, foreign_key: {on_delete: :cascade}
      t.references :improvement, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
