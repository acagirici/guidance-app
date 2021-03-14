class Student < ApplicationRecord
    belongs_to :user
    has_many :notes
    has_many :users, through: :notes
    


end
