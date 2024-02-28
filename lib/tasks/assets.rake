namespace :assets do
    desc "Precompile assets"
    task :precompile do
      Rake::Task["assets:precompile:all"].invoke
    end
  
    desc "Clean assets"
    task :clean do
      Rake::Task["assets:clean:all"].invoke
    end
  end