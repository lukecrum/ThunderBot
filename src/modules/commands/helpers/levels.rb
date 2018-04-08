def level_number(points)
  points = points

  if points >= 10 && points < 25
    1
  elsif points >= 25 && points < 100
    2
  elsif points >= 100 && points < 150
    3
  elsif points >= 150 && points < 250
    4
  elsif points >= 250 && points < 500
    5
  elsif points >= 500 && points < 1000
    6
  elsif points >= 1000 && points < 2000
    7
  elsif points >= 2000 && points < 2500
    8
  elsif points >= 2500 && points < 5000
    9
  elsif points >= 5000
    10
  else
    # nothing
    0
  end

end

def check_level(points)
  case points
  when 10
    # points 1 -
    'You have reached **level 1**! Run &&level to see your progress!'
  when 25
    # points 2
    'You have reached **level 2**! Run &&level to see your progress!'
  when 100
    # points 3
    'You have reached **level 3**! Run &&level to see your progress!'
  when 150
    # points 4
    'You have reached l**evel 4**! Run &&level to see your progress!'
  when 250
    # points 5
    'You have reached **level 5**! Run &&level to see your progress!'
  when 500
    # points 6
    'You have reached **level 6**! Run &&level to see your progress!'
  when 1000
    # points 7
    'You have reached **level 7**! Run &&level to see your progress!'
  when 2000
    # points 8
    'You have reached **level 8**! Run &&level to see your progress!'
  when 2500
    # points 9
    'You have reached **level 9**! Run &&level to see your progress!'
  when 5000
    # points 10
    'You have reached **level 10**! Run &&level to see your progress!'
  else
    # nothing
    ''
  end
end
