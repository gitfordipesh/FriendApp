class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    has_and_belongs_to_many :courses
    has_many :user_projects,dependent: :destroy
    has_many :projects, through: :user_projects

    
    validates :name, presence: true
    validates :city, presence: true, length: { minimum: 3 }  
end
