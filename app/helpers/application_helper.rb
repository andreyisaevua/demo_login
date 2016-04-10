module ApplicationHelper
  # Returns the full title on a per-page basis.
  def site_title(page_title)
    base_title = 'User notes demo'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

end
