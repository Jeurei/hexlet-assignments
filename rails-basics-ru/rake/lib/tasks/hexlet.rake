namespace :hexlet do
  desc 'Import users from passed csv'
  task :import_users, [:path] => :environment do |_t, args|
    require 'csv'
    CSV.foreach(args[:path], headers: true) do |row|
      User.create(row)
    end
  end
end
