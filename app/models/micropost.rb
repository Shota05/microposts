class Micropost < ActiveRecord::Base
    has_many :retweet_relationships, class_name:  "RelationshipRetweet",
                                     foreign_key: "retweet_id"
    has_many :retweet_microposts, through: :retweet_relationships, source: :retweeted
    has_many :retweeted_relationships, class_name:  "RelationshipRetweet",
                                     foreign_key: "retweeted_id"
    has_many :retweeted_microposts, through: :retweeted_relationships, source: :retweet
    has_many :favorite_relationships, class_name:  "RelationshipOkini",
                                     foreign_key: "favorite_id"
    has_many :favorite_users, through: :favorite_relationships, source: :favoriter
    belongs_to :user
    validates :user_id, presence: true
    validates :content, presence: true, length: { maximum: 140 }
end
