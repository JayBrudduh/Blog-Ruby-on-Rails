# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increment_comments_counter
    post.increment!(:comments_counter)
  end
end