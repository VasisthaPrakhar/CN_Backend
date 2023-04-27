class UserReg < ApplicationRecord
    has_many :regables, dependent: :destroy
    has_many :articles, through: :regables
end
