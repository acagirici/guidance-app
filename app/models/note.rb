class Note < ApplicationRecord
    belongs_to :user
    belongs_to :student
    validates :content, :created_at, :subject, presence: true

end
