ActionController::Routing::Routes.draw do |map|
  map.connect 'cards', :controller => 'cards', :action => 'index'
end
