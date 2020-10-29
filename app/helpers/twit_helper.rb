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
    if twit.user.id == current_user.id
      link_to "x", user_twit_path(twit.user.id, twit), method: :delete
    elsif !twit.retwits.exists?(retwiter: current_user)
      link_to "Retwit", retwit_twit_path(twit), method: :post
    else
      link_to "Unretwit", unretwit_twit_path(twit), method: :delete
    end
  end

  def render_body(twit)
    twit.body if !twit.mentions.any?
  end
end
