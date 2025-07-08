require 'json'

# Load the JSON
file_path = Rails.root.join('db', 'data', 'cv.json')
cv_data = JSON.parse(File.read(file_path))

puts "🌱 Seeding CV data..."

# Create main CV
cv = Cv.create!

# Personal Info
pi = cv_data['personal_info']
PersonalInfo.create!(
  name: pi['name'],
  title: pi['title'],
  email: pi['email'],
  phone: pi['phone'],
  location: pi['location'],
  linkedin: pi['linkedin'],
  github: pi['github'],
  cv: cv
)

# Summary
cv.update!(summary: cv_data['summary'])

# Technical Skills
ts = cv_data['technical_skills']
TechnicalSkill.create!(
  languages: ts['languages'] || [],
  frameworks: ts['frameworks'] || [],
  tools: ts['tools'] || [],
  soft: ts['soft'] || [],
  cv: cv
)

# Projects
cv_data['projects'].each do |proj|
  Project.create!(
    name: proj['name'],
    subtitle: proj['subtitle'],
    status: proj['status'],
    date: proj['date'],
    description: proj['description'],
    highlights: proj['highlights'],
    github: proj['github'],
    cv: cv
  )
end

# Education
cv_data['education'].each do |edu|
  EducationItem.create!(
    institution: edu['institution'],
    program: edu['program'],
    location: edu['location'],
    date: edu['date'],
    qualification: edu['qualification'],
    details: edu['details'],
    cv: cv
  )
end

# Experience
cv_data['experience'].each do |job|
  Experience.create!(
    role: job['role'],
    company: job['company'],
    location: job['location'],
    date: job['date'],
    job_type: job['type'],
    responsibilities: job['responsibilities'],
    cv: cv
  )
end

# Certifications
cv_data['certifications'].each do |cert|
  Certification.create!(
    name: cert['name'],
    issuer: cert['issuer'],
    date: cert['date'],
    cv: cv
  )
end

# Spoken Languages
cv_data['languages'].each do |lang|
  SpokenLanguage.create!(
    language: lang['language'],
    level: lang['level'],
    cv: cv
  )
end

puts "✅ Done seeding!"
