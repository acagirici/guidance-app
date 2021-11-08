class Student < ApplicationRecord
    belongs_to :user #optional: true
    belongs_to :category
    has_many :notes
    has_many :users, through: :notes
    validates :first_name, :last_name, :birth_date, :grade_level, :career_goal, presence: true

    scope :alpha_order, -> { order(:last_name) }
    
end
