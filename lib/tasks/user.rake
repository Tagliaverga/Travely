namespace :user do
  desc "Enrich all users with Clearbit (async)"
  task update_all: :environment do
    user = User.find(ENV["USER_ID"])
    # puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user)
    UserMailer.welcome(user_id).deliver_later
    # users = User.all
    # puts "Enqueuing update of #{users.size} users..."
    # users.each do |user|
    #   UpdateUserJob.perform_later(user)
    # end
    # rake task will return when all jobs are _enqueued_ (not done).
  end

#   desc "Enrich a given user with Clearbit (sync)"
#   task update: :environment do
#  _
#   end
end
