class CommentSerializer < ActiveModel::Serializer
  attributes :body, :id, :post_id
end
