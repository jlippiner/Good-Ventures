# /lib/tasks/deploy.rake
namespace :production do
  @environment = "production"
  @user = "v16"
  @host = "v16"
  @ssh_command = "ssh #{@host}"

  desc "Deploy"
  task :deploy do
    '#{@ssh_command} "source ~/.profile && deploy"'
  end

  desc "Restart"
  task :restart do
    '#{@ssh_command} "source ~/.profile && restart"'
  end

  desc "Run migrations"
  task :migrate do
    '#{@ssh_command} "source ~/.profile && backup_database && cd ~/current && rake db:migrate
  end

  desc "Run console"
  task :console do
    '#{@ssh_command} "source ~/.profile && console"'
  end

  desc "Run dbconsole"
  task :dbconsole do
    '#{@ssh_command} "source ~/.profile && dbconsole"'
  end
  
  desc "Update Github and deploy site and restart"
  task :update do
     unless comment = ENV["c"]
       puts "you must provide a comment"
     else
       puts "moving to V16's directory"
       %w{v16}
       
       puts "checking out master branch"
       %x{git checkout master}

       puts "updating modified files"
       %x{git diff}

       puts "adding new files"
       %x{git add *}

       puts "committing files with message: '#{comment}'"
       %x{git commit -a -m "#{comment}"}

       puts "pushing to github"
       %x{git push github master}

       puts "github update complete!"

       puts "deploying on server"
       %x{#{@ssh_command} "source ~/.profile && deploy"}

       puts "restarting server"
       %x{#{@ssh_command} "source ~/.profile && restart"}
       
       puts "restarting background fu"
       %x{#{@ssh_command} "RAILS_ENV=production ruby ~/current/script/daemons stop"}
       %x{#{@ssh_command} "RAILS_ENV=production ruby ~/current/script/daemons start"}
     end
   end
end

