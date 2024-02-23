# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :text
#  released    :boolean
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#16 Using validations to prevent unwanted data. SEARCH movies_controller.rb
class Book < ApplicationRecord
  validates(:title, presence: true)
  validates(:description, presence: true)
end
