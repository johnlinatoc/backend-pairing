require 'rails_helper'

describe Schedule, '#create_schedule' do
  schedule = Schedule.create(weeks: 10)
  schedule.weeks.times do
    Sprint.create(schedule_id: schedule.id)
  end 
  
  
  context 'given even number of devs' do
    it 'calls even_num_devs' do 
      # expect(schedule)
      puts User.all.count
    end
  end
  context 'given odd number of devs' do
    it 'calls odd_num_devs' do 
    end
  end
end