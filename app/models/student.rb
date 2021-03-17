class Student < ApplicationRecord
    belongs_to :user #optional: true
    has_many :notes
    has_many :users, through: :notes
    scope :alpha, -> { order(:first_name) }


end
