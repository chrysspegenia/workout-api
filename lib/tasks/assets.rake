namespace :assets do
    desc "Precompile assets"
    task :precompile do
      Rake::Task["assets:precompile"].invoke
    end
  
    desc "Clean assets"
    task :clean do
      Rake::Task["assets:clean"].invoke
    end
  end