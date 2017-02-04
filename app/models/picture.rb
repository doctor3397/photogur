class Picture < ApplicationRecord
  has_many :comments #comments table has a picture_id column
  # @picture.comments
  # @picture.comments <<
  # @picture.comments.where(...)
  # @picture.comments.count
  # etc

  #validates before the data is saved in db
  validates :artist, presence: true
  # minimum length 3 characters, maximum length 20 characters
  validates :title, length: { in: 3..20 }
  #url: be present, be unique
  validates :url, presence: true, uniqueness: true
  validates_format_of :url, :with =>
  /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/\S*)?/i
end
