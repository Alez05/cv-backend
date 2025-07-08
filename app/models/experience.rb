class Experience < ApplicationRecord
  belongs_to :cv
  serialize :responsibilities, JSON
end
