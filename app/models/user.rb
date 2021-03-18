class User < ApplicationRecord
    has_many :notes
    has_many :students, through: :notes
    has_secure_password

end
