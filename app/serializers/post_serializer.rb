class PostSerializer < ActiveModel::Serializer
  embed :ids, :include => true
  attributes :title, :body, :id
  has_many :comments
end
