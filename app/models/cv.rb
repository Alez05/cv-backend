class Cv < ApplicationRecord
  has_one :personal_info, dependent: :destroy
  has_one :technical_skill, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :education_items, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :certifications, dependent: :destroy
  has_many :spoken_languages, dependent: :destroy
end
