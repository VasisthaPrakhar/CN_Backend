class Article < ApplicationRecord
    has_many :taggables, dependent: :destroy
    has_many :tags, through: :taggables
    has_many :regables, dependent: :destroy
    has_many :user_regs, through: :regables
    validates :title, presence: true
  validates :desc, presence: true, length: { minimum: 10 }
end
