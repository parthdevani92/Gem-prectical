class Post < ApplicationRecord
    has_paper_trail on: [:update]
    belongs_to :user, class_name: 'User'
    has_many :comments, class_name: 'Comment', dependent: :destroy
    has_paper_trail class_name: 'PostVersion', 
                meta: { author_username: :user_name, word_count: :count_word }, on: [:destroy]
       
    def count_word
        body.split(' ').count
    end
end
