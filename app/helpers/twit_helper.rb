module TwitHelper
  def render_twit(twit)
    if twit.class.name == "Twit"
      data = { twit: twit }
    elsif twit.class.name == "Retwit"
      data = { twit: twit.twit, retwit: twit }
    end
    render partial:"twits/twit", locals: data
  end

  def render_action(twit)
    if !twit.retwits.exists?(retwiter: current_user)
      link_to "Retwit", retwit_twit_path(twit), method: :post, class: "button" 
    else
      link_to "Unretwit", unretwit_twit_path(twit), method: :delete, class: "button"
    end
  end

  def render_body(twit)
    return twit.body unless twit.mentions.any?
    processed_body = twit.body.to_s
    twit.mentions.each do |mention|
      processed_body = processed_body.gsub(/@#{mention.user.username}\b/, "<a href='/user/#{mention.user.id}' class='mention' >@#{mention.user.username}</a>")
    end
    return processed_body.html_safe
  end
end
