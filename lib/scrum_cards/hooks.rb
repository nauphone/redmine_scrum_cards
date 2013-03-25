module RedmineScrumCards
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_issues_context_menu_end,
	      :partial => 'hooks/scrum_cards/view_issues_context_menu_end'
  end
end
