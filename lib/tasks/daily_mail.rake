desc "Send email to users"
namespace :daily do
  task email_sender: :environment do
    User.all.each do |user|
      UserMailer.daily_mail(user).deliver_now
    end
  end
end

#desc "This task is called by the Heroku scheduler add-on"
#task :update_feed => :environment do
#  puts "Updating feed..."
#  NewsFeed.update
#  puts "done."
#end

#task :send_reminders => :environment do
#  User.send_reminders
#end