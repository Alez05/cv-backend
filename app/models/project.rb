class Project < ApplicationRecord
  belongs_to :cv

  serialize :highlights, JSON
end
