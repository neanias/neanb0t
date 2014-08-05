class Yo
  include Cinch::Plugin

  match /^!yo ?(.*)/i

  def execute(msg, query)
    if query.empty?
      msg.reply "Yo, #{msg.user.nick}"
    else
      msg.reply "Yo, #{query}"
    end
  end
end
