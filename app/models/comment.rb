class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user , optional: true
  belongs_to :seller, optional: true

  validates :text, presence: true
end
