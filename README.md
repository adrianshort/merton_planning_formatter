# Merton Planning Formatter

Formats Merton Council planning application descriptions/proposals nicely.

Converts uppercase descriptions to a readable mixed case format while preserving capitalisation for some proper nouns (eg Merton) and abbreviations (eg LBM, WC), [use classes](https://www.planningportal.co.uk/info/200130/common_projects/9/change_of_use) (eg A1, B1(c), D2), trees (eg TPO, M123, T20) and application reference numbers (eg 19/P1234).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'merton_planning_formatter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install merton_planning_formatter

## Usage

Some real examples:

```ruby
require 'merton_planning_formatter'

description = "APPLICATION TO DISCHARGE CONDITION 22 (CAR LIFT) ATTACHED TO LBM PLANNING PERMISSION 19/P0140 (PART DEMOLITION AND ERECTION OF A REPLACEMENT DWELLINGHOUSE)"

puts MertonPlanningFormatter::format(description)

# => Application to discharge condition 22 (car lift) attached to LBM planning permission 19/P0140 (part demolition and erection of a replacement dwellinghouse)

description = "APPLICATION TO DETERMINE WHETHER PRIOR APPROVAL IS REQUIRED IN RESPECT OF THE PROPOSED CHANGE OF USE FROM OFFICE SPACE (CLASS B1a) TO RESIDENTIAL (CLASS C3) TO CREATE 1 RESIDENTIAL UNIT (CLASS C3)"

puts MertonPlanningFormatter::format(description)

# => Application to determine whether prior approval is required in respect of the proposed change of use from office space (class B1a) to residential (class C3) to create 1 residential unit (class C3)

description = "APPLICATION FOR DISCHARGE OF CONDITION 25 ATTACHED LBM PLANNING PERMISSION 18/P4447 RELATING TO THE DEMOLITION OF EXISTING BUILDINGS AND STRUCTURES, AND REDEVELOPMENT FOR A NEW 8 - STOREY BUILDING (PLUS ADDITIONAL PLANT AT ROOF LEVEL) COMPRISING OF A HOTEL (USE CLASS C1) AND THREE COMMERCIAL UNITS (A FLEXIBLE USE WITHIN CLASSES A1, A2, A3 AND / OR A4); SUBSTATION; ALTERATIONS TO EXISTING ACCESS AND CREATION OF NEW ACCESS ON GRAHAM ROAD; HARD AND SOFT LANDSCAPING, GROUND WORKS AND ASSOCIATED INFRASTRUCTURE."

puts MertonPlanningFormatter::format(description)

# => Application for discharge of condition 25 attached LBM planning permission 18/P4447 relating to the demolition of existing buildings and structures, and redevelopment for a new 8 - storey building (plus additional plant at roof level) comprising of a hotel (use class C1) and three commercial units (a flexible use within classes A1, A2, A3 and / or A4); substation; alterations to existing access and creation of new access on graham road; hard and soft landscaping, ground works and associated infrastructure.

# Note that "Graham Road" is not capitalised.

description = "TPO M529: FRONT GARDEN - MATURE BEECH TREE (T2) TO BE REMOVED DUE TO STRUCTURAL WEAKNESS IN STEM AND UPPER CANOPY (REPLACEMENT PLANTING PROPOSED)."

puts MertonPlanningFormatter::format(description)

# => TPO M529: front garden - mature beech tree (T2) to be removed due to structural weakness in stem and upper canopy (replacement planting proposed).

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adrianshort/merton_planning_formatter.

