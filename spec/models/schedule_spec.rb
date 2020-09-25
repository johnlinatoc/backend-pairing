require 'rails_helper'

describe Schedule, '#create_schedule' do
  subject {described_class.new(weeks: 10)}
  self.weeks.times { Sprint.create(schedule_id: self.id) }
  devs = [
    {
      "name": "Julia"
    },
    {
      "name": "Xing"
    },
    {
      "name": "Katie"
    },
    {
      "name": "John"
    },
    {
      "name": "Sarah"
    }
  ]

  context 'given even number of devs' do
    it 'calls even_num_devs' do 
      puts Sprint.all
    end
  end
  context 'given odd number of devs' do
    it 'calls odd_num_devs' do 
    end
  end
end