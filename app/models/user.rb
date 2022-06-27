class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    has_and_belongs_to_many :courses
    has_many :user_projects,dependent: :destroy
    has_many :projects, through: :user_projects

    
    validates :name, presence: true
    validates :city, presence: true, length: { minimum: 3 }
    
    validates :name, :city ,format:{with:/\A[a-zA-Z]+\z/ , message:"Only Alphabets are allowed"}

    def user_with_city
        "#{name} #{city}"
    end
end
