class User < ApplicationRecord
    has_secure_password
    has_many :beers, dependent: :destroy
    
    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
