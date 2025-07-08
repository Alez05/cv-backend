class Api::V1::CvController < ApplicationController
  def index
    cv = Cv.includes(
      :personal_info,
      :technical_skill,
      :projects,
      :education_items,
      :experiences,
      :certifications,
      :spoken_languages
    ).first

    tech = cv.technical_skill

    # Safely parse the serialized fields
    parsed_tech = {
      id: tech.id,
      languages: tech.languages || [],
      frameworks: tech.frameworks || [],
      tools: tech.tools || [],
      soft: tech.soft || [],
      created_at: tech.created_at,
      updated_at: tech.updated_at,
      cv_id: tech.cv_id
    }

    render json: cv.as_json(
      include: {
        personal_info: {},
        technical_skill: { except: [:languages, :frameworks, :tools, :soft] },
        projects: {},
        education_items: {},
        experiences: {},
        certifications: {},
        spoken_languages: {}
      }
    ).merge(technical_skill: parsed_tech)
  end
end
