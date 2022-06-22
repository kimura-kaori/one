User.seed do |s|
  s.id = 1
  s.email = 'sample1@example.com'
  s.password = '111111'
  s.admin = false
  s.confirmed_at = Time.now
end

User.seed do |s|
  s.id = 2
  s.email = 'sample2@example.com'
  s.password  = '111111'
  s.admin = false
  s.confirmed_at = Time.now
end

User.seed do |s|
  s.id = 3
  s.email = 'sample3@example.com'
  s.password  = '111111'
  s.admin = false
  s.confirmed_at = Time.now
end

User.seed do |s|
  s.id = 4
  s.email = 'sample4@example.com'
  s.password  = '111111'
  s.admin = false
  s.confirmed_at = Time.now
end

User.seed do |s|
  s.id = 5
  s.email = 'sample5@example.com'
  s.password  = '111111'
  s.admin = true
  s.confirmed_at = Time.now
end
