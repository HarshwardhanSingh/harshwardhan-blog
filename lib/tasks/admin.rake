namespace :admin do
  desc "Create admin record"
    task create: :environment do
      ARGV.each { |a| task a.to_sym do ; end }
      admin = Admin.new
      admin.username = ARGV[1]
      admin.password = ARGV[2]
      if admin.save!
        puts "Admin created!"
      else
        puts "Admin creation failed!"
      end
    end
end
