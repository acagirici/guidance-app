# Guidance App

## User
### has_many :notes
### has_many :students, through: :notes
### username
### email
### password_digest



## Meeting Notes *join table joining students & users
### belongs_to :user
### belongs_to :student
### content


## Resources


## Students
### has_many :notes
### has_many :users, through :notes
### first_name
### last_name
### birth_date
### grade_level
### career_goal => 2-year, apprenticeship, 4-year, gap_year.

