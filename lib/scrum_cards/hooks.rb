module RedmineScrumCards
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_issues_context_menu_end, :partial => 'hooks/scrum_cards/view_issues_context_menu_end'
    render_on :view_issues_show_action_menu, :partial => 'hooks/scrum_cards/action_menu_hook'
  end
end
