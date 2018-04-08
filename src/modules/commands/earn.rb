require_relative 'helpers/levels.rb'

module Bot::DiscordCommands
  # Responds with "Pong!".
  # This used to check if bot is alive
  module Earn
    extend Discordrb::Commands::CommandContainer
    command :earn do |_event|
      user = _event.author.username
      filename = "userdata/#{user}.yml"
      if File.file?(filename) == true
        #add point and save
        d = YAML.load_file(filename)
        d['data'][user]['points'] = d['data'][user]['points'] + 1
        File.open(filename, 'w') { |f| f.write d.to_yaml }
      elsif File.file?(filename) != true
        data = { 'data' => { user => { 'level' => 0, 'points' => 1 } } }
        File.open(filename, 'w+') { |f| f.write data.to_yaml }
      else
        "Something went wrong :("
      end
      if check_level(d['data'][user]['points']) != ""
        data = YAML.load_file(filename)
        data['data'][user]['level'] = level_number(d['data'][user]['points'])
        File.open(filename, 'w') { |f| f.write data.to_yaml }
      end
      d = YAML.load_file(filename)
      points = d['data'][user]['points']
      "Congratulations, #{_event.author.mention} You earned one point! You now have **#{points}** points!\n#{check_level(points)}"
    end
  end
end
