class Api::V1::CvController < ApplicationController
  def index
    cv = Cv.includes(
      :personal_info,
      :summary,
      :skills,
      :projects,
      :educations,
      :experiences,
      :certifications,
      :languages
    ).first

    parse_json_safe = ->(field) do
      return [] if field.nil? || field.empty?

      JSON.parse(field)
    rescue JSON::ParserError
      [field]
    end

    render json: {
      personal_info: {
        name: cv.personal_info&.name,
        title: cv.personal_info&.title,
        email: cv.personal_info&.email,
        phone: cv.personal_info&.phone,
        location: cv.personal_info&.location,
        linkedin: cv.personal_info&.linkedin,
        github: cv.personal_info&.github
      },
      summary: {
        title: cv.summary&.title || "Summary",
        content: cv.summary&.content || ""
      },
      techskills: {
        title: "Technical Skills",
        content: cv.skills.each_with_object({}) do |skill, hash|
          parsed_content = skill.content.is_a?(String) ? parse_json_safe.call(skill.content) : skill.content
          hash[skill.title] = {
            name: skill.title,
            content: parsed_content
          }
        end
      },
      projects: {
        title: "Projects",
        content: cv.projects.map do |p|
          {
            name: p.name,
            date: p.date,
            description: p.description,
            highlights: p.highlights.is_a?(String) ? parse_json_safe.call(p.highlights) : p.highlights,
            github: p.github
          }
        end
      },
      education: {
        title: "Education",
        content: cv.educations.map do |edu|
          {
            name: edu.name,
            location: edu.location,
            date: edu.date,
            details: edu.details.is_a?(String) ? parse_json_safe.call(edu.details) : edu.details
          }
        end
      },
      experience: {
        title: "Experience",
        content: cv.experiences.map do |exp|
          {
            name: exp.name,
            location: exp.location,
            date: exp.date.present? ? exp.date.strftime("%m/%Y") : exp.date.to_s,
            details: exp.details.is_a?(String) ? parse_json_safe.call(exp.details) : exp.details,
            title: exp.title
          }
        end
      },
      certification: {
        title: "Certifications",
        content: cv.certifications.map do |cert|
          {
            name: cert.name,
            issuer: cert.issuer,
            date: cert.date.present? ? cert.date.strftime("%B %Y") : cert.date.to_s
          }
        end
      },
      languages: {
        title: "Languages",
        content: cv.languages.map do |lang|
          {
            language: lang.language,
            level: lang.level
          }
        end
      }
    }
  end
end
