module NavHelper
  def page_with_sidebar_class
    class_name = page_gutter_class
    class_name << 'page-with-new-sidebar' if defined?(@left_sidebar) && @left_sidebar
    class_name << 'page-with-icon-sidebar' if collapsed_sidebar? && @left_sidebar

    class_name
  end

  def page_gutter_class
    if current_path?('merge_requests#show') ||
        current_path?('projects/merge_requests/conflicts#show') ||
        current_path?('issues#show') ||
        current_path?('milestones#show')
      if cookies[:collapsed_gutter] == 'true'
        %w[page-gutter right-sidebar-collapsed]
      else
        %w[page-gutter right-sidebar-expanded]
      end
    elsif current_path?('jobs#show')
      %w[page-gutter build-sidebar right-sidebar-expanded]
    elsif current_path?('wikis#show') ||
        current_path?('wikis#edit') ||
        current_path?('wikis#update') ||
        current_path?('wikis#history') ||
        current_path?('wikis#git_access')
      %w[page-gutter wiki-sidebar right-sidebar-expanded]
    else
      []
    end
  end

  def nav_control_class
    "nav-control" if current_user
  end
end
