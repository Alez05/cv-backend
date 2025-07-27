require 'json'

# Clean slate
Cv.destroy_all
PersonalInfo.destroy_all
Summary.destroy_all
Project.destroy_all
Skill.destroy_all
Experience.destroy_all
Education.destroy_all
Certification.destroy_all
Language.destroy_all

puts "Old records cleared."

# Load data
cv_data = JSON.parse(File.read(Rails.root.join('db', 'data', 'cv.json')))

# Create CV
cv = Cv.create!
puts "CV created."

# Personal Info
PersonalInfo.create!(
  name: cv_data["personal_info"]["name"],
  title: cv_data["personal_info"]["title"],
  location: cv_data["personal_info"]["location"],
  email: cv_data["personal_info"]["email"],
  phone: cv_data["personal_info"]["phone"],
  linkedin: cv_data["personal_info"]["linkedin"],
  github: cv_data["personal_info"]["github"],
  cv: cv
)
puts "Personal info added."

# Summary
Summary.create!(
  title: cv_data["summary"]["title"],
  content: cv_data["summary"]["content"],
  cv: cv
)
puts "Summary added."

# Projects
cv_data["projects"]["content"].each do |proj|
  Project.create!(
    name: proj["name"],
    date: proj["date"],
    description: proj["description"],
    highlights: proj["highlights"].join("\n"),
    github: proj["github"],
    cv: cv
  )
end
puts "Projects added."

# Technical Skills
cv_data["techskills"]["content"].each do |key, skill_data|
  Skill.create!(
    title: skill_data["name"],
    content: skill_data["content"].join(", "),
    cv: cv
  )
end
puts "Technical skills added."

# Experience
cv_data["experience"]["content"].each do |exp|
  Experience.create!(
    name: exp["name"],
    location: exp["location"],
    date: exp["date"],
    details: exp["details"].join("\n"),
    cv: cv
  )
end
puts "Experience added."

# Education
cv_data["education"]["content"].each do |edu|
  Education.create!(
    name: edu["name"],
    location: edu["location"],
    date: edu["date"],
    details: edu["details"].join("\n"),
    cv: cv
  )
end
puts "Education added."

# Certifications
cv_data["certification"]["content"].each do |cert|
  Certification.create!(
    name: cert["name"],
    issuer: cert["issuer"],
    date: cert["date"],
    cv: cv
  )
end
puts "Certifications added."

# Languages
cv_data["languages"]["content"].each do |lang|
  Language.create!(
    language: lang["language"],
    level: lang["level"],
    cv: cv
  )
end
puts "Languages added."

puts "✅ Seeding complete."
