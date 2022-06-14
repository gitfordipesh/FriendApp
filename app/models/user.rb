class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    validates :name, presence: true
    validates :city, presence: true, length: { minimum: 3 }  
end
