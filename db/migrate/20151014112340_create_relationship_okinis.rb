class CreateRelationshipOkinis < ActiveRecord::Migration
  def change
    create_table :relationship_okinis do |t|
      t.references :favorite, index: true
      t.references :favoriter, index: true

      t.timestamps null: false
      
       t.index [:favorite_id, :favoriter_id], unique: true # この行を追加
    end
  end
end
