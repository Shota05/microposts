class RelationshipOkini < ActiveRecord::Base
  belongs_to :favorite, class_name: "Micropost"
  belongs_to :favoriter, class_name: "User"
end
