Factory.define :user do |f|
  f.name Random.firstname
  f.password "secret"
  f.password_confirmation "secret"
  f.email Random.email
  f.login Random.firstname
end

Factory.define :client do |f|
  f.association :owner, :factory => :user 
  f.name "#{Random.firstname} LLC"
end

Factory.define :website do |f|
  f.association :client
  f.name "#{Random.firstname}.com"
  f.url "http://www.test.com"
end

Factory.define :visit do |f|
  f.association :website
  f.landing_page Random.alphanumeric
  f.tag Random.alphanumeric
  f.second_page Random.alphanumeric
  f.ip_address "127.0.0.1"
  f.referrer Random.alphanumeric
end

Factory.define :conversion do |f|
  f.association :visit
  f.value Random.number(1000)
end
