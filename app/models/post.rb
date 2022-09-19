class Post < ApplicationRecord
    has_paper_trail
    has_many :comments, class_name: 'Comment', dependent: :destroy
end
