class ChangeColumnBirthType < ActiveRecord::Migration[6.1]
  change_column(:students, :birth_date, :datetime)
end
