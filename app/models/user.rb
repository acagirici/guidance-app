class User < ApplicationRecord
    has_many :students
    has_many :notes
    has_many :noted_students, through: :notes
    has_secure_password

    validates :username, :email, presence: true

end
