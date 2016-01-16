unless User.exists?(email: "admin@ticketee.com")
  User.create!(email: "admin@ticketee.com", password: "password", admin: true)
end

unless User.exists?(email: "viewer@ticketee.com")
  User.create!(email: "viewer@ticketee.com", password: "password")
end

unless User.exists?(email: "editor@ticketee.com")
  User.create!(email: "editor@ticketee.com", password: "password")
end

unless User.exists?(email: "manager@ticketee.com")
  User.create!(email: "manager@ticketee.com", password: "password")
end

["Atom", "Internet Explorer"].each do |name|
  unless Project.exists?(name: name)
    Project.create!(name: name, description: "A sample project about #{name}")
  end
end

unless State.exists?
  State.create(name: "New", color: "#0066CC", default: true)
  State.create(name: "Open", color: "#008000")
  State.create(name: "Closed", color: "#990000")
  State.create(name: "Awesome", color: "#663399")
end
