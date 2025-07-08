class TechnicalSkill < ApplicationRecord
  belongs_to :cv

  serialize :languages, JSON
  serialize :frameworks, JSON
  serialize :tools, JSON
  serialize :soft, JSON
end
