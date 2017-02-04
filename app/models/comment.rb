class Comment < ApplicationRecord
  belongs_to :picture
  #comments table has a picture_id col
  # @comment.picture
  # @comment.picture =
  # etc

end
