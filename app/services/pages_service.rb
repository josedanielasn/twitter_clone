class PagesService
  POST_PER_PAGE = 10.0
  attr_accessor :page
  def initialize(type, query, page)
    @query = query
    @page = page
    @type = type
  end
  
  def get_items
    if @type == 'post'
      return Twit.where(user: @query).order(created_at: :desc).offset((@page - 1) * POST_PER_PAGE).limit(POST_PER_PAGE)
    elsif @type == 'following'
      return @query.followings.order(created_at: :desc).offset((@page - 1) * POST_PER_PAGE).limit(POST_PER_PAGE)
    elsif @type == 'followers'
      return @query.followers.order(created_at: :desc).offset((@page - 1) * POST_PER_PAGE).limit(POST_PER_PAGE)
    elsif @type == 'user_index'
      return @query.order(created_at: :desc).offset((@page - 1) * POST_PER_PAGE).limit(POST_PER_PAGE)
    elsif @type == 'notification'
      return Notification.where(user: @query).order(is_read: :asc).order(created_at: :desc).offset((@page - 1) * POST_PER_PAGE).limit(POST_PER_PAGE)
    elsif @type == 'hashtag_index'
      return @query.twits.order(created_at: :desc).offset((@page - 1) * POST_PER_PAGE).limit(POST_PER_PAGE)
    end
  end
  
  def count_pages
    if @type == 'post'
      return count(Twit.where(user: @query).size)
    elsif @type == 'following'
      return count(@query.followings.size)
    elsif @type == 'followers'
      return count(@query.followers.size)
    elsif @type == 'user_index'
      return count(@query.size)
    elsif @type == 'notification'
      return count(Notification.where(user: @query).size)
    elsif @type == 'hashtag_index'
      return count(@query.twits.size)
    end
  end

  private
    def count(records)
      (records / POST_PER_PAGE).ceil()
    end
end
