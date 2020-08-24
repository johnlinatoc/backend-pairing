# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

data = {
    "projectDurationMonths": 3,
    "sprintDurationWeeks": 1,
    "developers": [
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
      },
      {
        "name": "Mattie"
      }
    ]
}

schedule = Schedule.create(weeks: (data[:projectDurationMonths] * 4))


data[:developers].each {|dev| User.create(name: dev[:name])}
a=schedule.create_schedule
