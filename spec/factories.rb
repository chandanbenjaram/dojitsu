# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.fname                  "John"
  user.lname                  "Doe"
  user.emailid                 "john.doe@example.com"
  user.password              "johndoe"
  user.password_confirmation "johndoe"
end