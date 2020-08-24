require "user.rb"
class Schedule < ApplicationRecord
    has_many :users

    def create_schedule
        developers = []
        User.all.each {|user| developers.push(user.name)}
        pairs = {}
        weeks = self.weeks

        if developers.length % 2 === 0 
            evenNumDevs(developers, pairs, weeks)
        else
            oddNumDevs(developers, pairs, weeks)
        end
    end

    def oddNumDevs(developers, pairs, weeks)
        sprint = 1

        while sprint <= weeks
            current_sprint = "sprint #{sprint}"
            pairs[current_sprint] = []
            count = 0
            last_dev = developers.last

            first_devs = developers[0...developers.length/2]
            last_devs = (developers[(developers.length/2), first_devs.length]).reverse

            while count < first_devs.length
                pairs[current_sprint].push([first_devs[count], last_devs[count]])
                count += 1
            end

            pairs[current_sprint].push([last_dev])

            developers.unshift(last_dev)
            developers.pop
            sprint += 1
        end
        JSON.generate(pairs)
    end

    def evenNumDevs(developers, pairs, weeks)
        sprint = 1
        first_dev = developers[0]
        all_devs_except_first = developers[1..-1]

        while sprint <= weeks
            current_sprint = "sprint #{sprint}"
            pairs[current_sprint] = []
            count = 0
            last_dev = all_devs_except_first.last

            first_devs = all_devs_except_first[0...all_devs_except_first.length/2]
            last_devs = (all_devs_except_first[(all_devs_except_first.length/2), all_devs_except_first.length]).reverse
            first_devs.unshift(first_dev)

            while count < first_devs.length
                pairs[current_sprint].push([first_devs[count], last_devs[count]])
                count += 1
            end

            first_devs.shift
            all_devs_except_first.pop
            all_devs_except_first.unshift(last_dev)

            sprint += 1
        end
        JSON.generate(pairs)
    end
end