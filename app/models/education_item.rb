class EducationItem < ApplicationRecord
  belongs_to :cv
  serialize :details, JSON
end
