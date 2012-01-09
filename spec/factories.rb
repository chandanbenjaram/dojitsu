# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define(:challenge) do |aChallenge|
  aChallenge.title "Social challenge"
  aChallenge.description "Testing description"
  aChallenge.user_id "100002573213371"
  aChallenge.is_complete "0"
  aChallenge.canCompleteBeforeTasks "true"
  aChallenge.updated_at "Tue, 03 Jan 2012 19:10:11 GMT +05:30"
  aChallenge.created_at "Tue, 03 Jan 2012 19:10:11 GMT +05:30"
end
