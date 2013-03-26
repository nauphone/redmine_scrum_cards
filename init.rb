require 'redmine'
require 'rubygems'
require "prawn"
require_dependency 'scrum_cards/hooks'
Redmine::Plugin.register :redmine_scrum_cards do
  name 'Redmine Scrum Cards plugin'
  author 'Evgeny Tataurov'
  description 'Redmine plugin for generating printable scrum board cards'
  version '0.0.1'
  url ''
  author_url ''
end
