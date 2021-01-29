class User < ApplicationRecord
    has_secure_password
    has_many :watchlists
    has_many :portfolios
end
