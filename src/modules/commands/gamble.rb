module Bot::DiscordCommands
  # Responds with "Pong!".
  # This used to check if bot is alive
  module Gamble
    extend Discordrb::Commands::CommandContainer
    command :gamble do |_event|
      user = _event.author.username
      filename = "userdata/#{user}.yml"
      d = YAML.load_file(filename)
      points = d['data'][user]['points']
      rand = Random.new.rand(2) + 1
      line = _event.message
      line = line.to_s
      bet = line.scan(/\d/).join('').to_i
      guess_heads = line.scan(/(\bheads\b)/)
      guess_tails = line.scan(/(\btails\b)/)
      if points >= bet && guess_heads == [["heads"]]
        _event.respond "#{_event.author.mention}, you gambled #{bet} points and you said heads!"
        if rand == 1
          #win
          d['data'][user]['points'] = d['data'][user]['points'] + bet
          File.open(filename, 'w') { |f| f.write d.to_yaml }
          #_event.respond "Congratulations, #{_event.author.mention}!, You won! You bet #{bet} points. You now have #{d['data'][user]['points']} points!"
          _event.channel.send_embed do |embed|
            embed.title = ":tada: Congratulations! :tada:"
            embed.add_field(name: "Your bet: ", value: "#{bet} points", inline: false)
            embed.add_field(name: "You now have: ", value: "#{d['data'][user]['points']} points")
            embed.thumbnail = Discordrb::Webhooks::EmbedImage.new(url: "http://lukecrum.xyz/images/tada.png")
          end
        else
          #lose
          d['data'][user]['points'] = d['data'][user]['points'] - bet
          File.open(filename, 'w') { |f| f.write d.to_yaml }
          #_event.respond "Uh-oh, #{_event.author.mention}! You guesssed incorrectly. You lost #{bet} points. You now have #{d['data'][user]['points']} points."
          _event.channel.send_embed do |embed|
            embed.title = ":sob: Oh no! You guessed incorrectly! :sob:"
            embed.add_field(name: "Your bet: ", value: "#{bet} points", inline: false)
            embed.add_field(name: "You now have: ", value: "#{d['data'][user]['points']} points")
            embed.thumbnail = Discordrb::Webhooks::EmbedImage.new(url: "http://lukecrum.xyz/images/sob.png")
          end
        end
      elsif points >= bet && guess_tails == [["tails"]]
        _event.respond "#{_event.author.mention}, you gambled #{bet}  points and you said tails!"
        if rand == 2
          #win
          d['data'][user]['points'] = d['data'][user]['points'] + bet
          File.open(filename, 'w') { |f| f.write d.to_yaml }
          #_event.respond "Congratulations, #{_event.author.mention}!, You won! You bet #{bet} points. You now have #{d['data'][user]['points']} points!"
          _event.channel.send_embed do |embed|
            embed.title = ":tada: Congratulations! :tada:"
            embed.add_field(name: "Your bet: ", value: "#{bet} points", inline: false)
            embed.add_field(name: "You now have: ", value: "#{d['data'][user]['points']} points")
            embed.thumbnail = Discordrb::Webhooks::EmbedImage.new(url: "http://lukecrum.xyz/images/tada.png")
          end
        else
          #lose
          d['data'][user]['points'] = d['data'][user]['points'] - bet
          File.open(filename, 'w') { |f| f.write d.to_yaml }
          #_event.respond "Uh-oh, #{_event.author.mention}! You guesssed incorrectly. You lost #{bet} points. You now have #{d['data'][user]['points']} points."
          _event.channel.send_embed do |embed|
            embed.title = ":sob: Oh no! You guessed incorrectly! :sob:"
            embed.add_field(name: "Your bet: ", value: "#{bet} points", inline: false)
            embed.add_field(name: "You now have: ", value: "#{d['data'][user]['points']} points")
            embed.thumbnail = Discordrb::Webhooks::EmbedImage.new(url: "http://lukecrum.xyz/images/sob.png")
          end
        end
      elsif points >= bet && guess_tails == [] && guess_heads == []
        _event.respond "#{_event.author.mention}, please say heads or tails to gamble"
      elsif points < bet
        _event.respond "#{_event.author.mention}, you do not have enough points to gamble that much"
      end
    end
  end
end
