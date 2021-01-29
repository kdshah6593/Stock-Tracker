class User < ApplicationRecord
    has_secure_password
    has_many :watchlists
    has_many :portfolios
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
end
