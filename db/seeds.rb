DEPARTMENT = ["sales","marketing","technical"]

50.times do
  SupportRequest.create name: Faker::Name.name,
                        email: Faker::Internet.email,
                        department: DEPARTMENT.sample,
                        message: Faker::Lorem.paragraph,
                        done: [true, false].sample
end

# special records for testing paginated search
200.times do
  SupportRequest.create name: "Alex Taylor",
                        email: "alexmctaylorpants@gmail.com",
                        department: DEPARTMENT.sample,
                        message: Faker::Lorem.paragraph,
                        done: [true, false].sample
end
