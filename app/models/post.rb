class Post
  include Mongoid::Document

  field :title, type: String
  field :body, type: String
  field :likes, type: Integer, default: 0

  has_many :comments
end
