require 'rails_helper'

describe Schedule do
  describe "#create_schedule" do
    before :each do
      schedule = create(:schedule, weeks: 10)
      schedule.weeks.times do
        create(:sprint, schedule_id: schedule.id)
      end 

    end
    
    context 'given even number of devs' do
      it 'calls even_num_devs' do 
       puts Schedule.all.count
      end
    end
    context 'given odd number of devs' do
      it 'calls odd_num_devs' do 
      end
    end
  end

end