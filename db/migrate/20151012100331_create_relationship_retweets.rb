class CreateRelationshipRetweets < ActiveRecord::Migration
  def change
    create_table :relationship_retweets do |t|
      t.references :retweet, index: true
      t.references :retweeted, index: true

      t.timestamps null: false
      t.index [:retweet_id, :retweeted_id], unique: true 
    end
  end
end
