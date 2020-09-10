require "user.rb"
class Schedule < ApplicationRecord
    has_many :sprints

    # refactor User and Sprint methods
    def create_schedule
        developers = []
        User.all.each {|user| developers.push(user)}
        weeks = self.weeks
        weeks.times do
            Sprint.create(schedule_id: self.id)
        end
        sprints = []
        Sprint.where(schedule_id: self.id).each {|sprint| sprints.push(sprint)}

        if developers.length % 2 === 0 
            even_num_devs(developers, weeks, sprints)
        else
            odd_num_devs(developers, weeks, sprints)
        end
    end

    # move some implementation to the other groups
    def odd_num_devs(developers, weeks, sprints)
        sprint = 0
            puts "made inside odd"
        while sprint < weeks
            count = 0
            last_dev = developers.last
            current_sprint = sprints[sprint]

            first_devs = developers[0...developers.length/2]
            last_devs = (developers[(developers.length/2), first_devs.length]).reverse

            
            while count < first_devs.length
                pair = Pair.create(sprint_id: current_sprint.id)
                ScheduledPair.create(pair_id: pair.id, user_id: first_devs[count].id)
                ScheduledPair.create(pair_id: pair.id, user_id: last_devs[count].id)
                count += 1
            end

            pair = Pair.create(sprint_id: current_sprint.id)
            ScheduledPair.create(pair_id: pair.id, user_id: last_dev.id)

            developers.unshift(last_dev)
            developers.pop
            
            sprint += 1
        end
    end

    def even_num_devs(developers, weeks, sprints)
        puts "made inside even"
        sprint = 0
        first_dev = developers[0]
        all_devs_except_first = developers[1..-1]
        
        while sprint < weeks
            current_sprint = sprints[sprint]
            count = 0
            last_dev = all_devs_except_first.last

            first_devs = all_devs_except_first[0...all_devs_except_first.length/2]
            last_devs = (all_devs_except_first[(all_devs_except_first.length/2), all_devs_except_first.length]).reverse
            first_devs.unshift(first_dev)

            while count < first_devs.length
                pair = Pair.create(sprint_id: current_sprint.id)
                ScheduledPair.create(pair_id: pair.id, user_id: first_devs[count].id)
                ScheduledPair.create(pair_id: pair.id, user_id: last_devs[count].id)
                count += 1
            end

            first_devs.shift
            all_devs_except_first.pop
            all_devs_except_first.unshift(last_dev)

            sprint += 1
        end
    end
end