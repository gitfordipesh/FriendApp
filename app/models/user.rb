class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    has_and_belongs_to_many :courses
    validates :name, presence: true
    validates :city, presence: true, length: { minimum: 3 }  
end
