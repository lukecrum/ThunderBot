module Bot::DiscordCommands
  # Responds with "Pong!".
  # This used to check if bot is alive
  module Level
    extend Discordrb::Commands::CommandContainer
    command :level do |_event|
      user = _event.author.username
      filename =  "userdata/#{user}.yml"
      data = YAML.load_file(filename)
      _event.channel.send_embed do |embed|
        embed.title = "**#{_event.author.username}'s** Stats"
        embed.thumbnail = Discordrb::Webhooks::EmbedImage.new(url: _event.author.avatar_url)
        embed.add_field(name: "Level", value: data['data'][user]['level'], inline: true)
        embed.add_field(name: "Points", value: data['data'][user]['points'], inline: false)
      end
    end
  end
end
