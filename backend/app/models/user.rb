class User < ApplicationRecord
    has_secure_password
    has_many :beers, dependent: :destroy
end
