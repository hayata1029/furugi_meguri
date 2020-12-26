module ApplicationHelper
  BASE_TITLE = "ふるぎめぐり".freeze
  def full_title(page_title)
    if page_title.blank?
      BASE_TITLE
    else
      "#{BASE_TITLE}-#{page_title}"
    end
  end
end
