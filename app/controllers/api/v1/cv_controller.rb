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

        render json: cv.as_json(
          include: {
            personal_info: {},
            technical_skill: {},
            projects: {},
            education_items: {},
            experiences: {},
            certifications: {},
            spoken_languages: {}
          }
        )
  end
end
