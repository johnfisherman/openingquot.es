module ApplicationHelper
  def current_page?(path)
    request.path == path
  end
end
