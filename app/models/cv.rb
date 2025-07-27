class Cv < ApplicationRecord
  has_one :personal_info, dependent: :destroy
  has_one :summary, dependent: :destroy

  has_many :projects, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :certifications, dependent: :destroy
end
