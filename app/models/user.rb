class User < ApplicationRecord
    has_secure_password
    has_many :watchlists, dependent: :destroy
    has_many :portfolios, dependent: :destroy
    validates :username, presence: true
    validates :username, uniqueness: true, on: :create
    validates :first_name, presence: true, on: :create
    validates :last_name, presence: true, on: :create
    validates :email, presence: true, on: :create
    validates :email, uniqueness: true, on: :create
end
