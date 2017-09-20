desc "Send email to users"
namespace :daily do
  task :email_sender => :environment do |_, args|
    User.find_each do |user|
      UserMailer.daily_mail(user).deliver
    end
  end
end