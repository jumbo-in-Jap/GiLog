#!/usr/bin/ruby

class GitLog
   
    def run
         gitlog = `git log --oneline --decorate --tags --remotes`;
         latest_tag = ""
         gitlog.each_line {|line| 
            commit = line.chomp
            if commit.include?("tag:") then
                if latest_tag != commit && latest_tag != ""
                    break
                end
                latest_tag = commit
            end

            if latest_tag != ""
                p commit
            end
        }
    end
end

l = GitLog.new()
l.run()
