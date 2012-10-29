Link to app:


About:
  Simple app to query Twitter. Type query and hit search.


Features:
- Supports all Twitter search parameters
  except 'nearby' which has to be geo-coded manually (I guess it's possible to do that using broswer location info, but it's not a terribly important feature)
  also results are only as good as Twitter's which are limited to at most a week past
- Attempt to make it pretty. Profile pics and some color
- pagination
- AJAX (no page refreshes)
- rspec and guard
  test for invalid queries (too long, blank)
  test for correct number of tweets displayed by view
  test for empty results page (try search for future tweet)


Technical:
- Main files:
  + app/models/search.rb
  + app/views/search/index.html.erb
  + app/search_controller.rb
- Twitter API accessed via 
  'twitter_search' gem (https://github.com/croaky/twitter-search)


Bugs:
- utf-8 (snowman) in search URL
  caused by Rails 3 patch for IE. Might be fixed by using form_for instead of form_tag in view
- "WARN Could not determine..." in server logs
  caused by Webrick gem bug. Dev says it doesn't break anything but he's working on a fix. Might be fixed by switching to Thin gem.


Unsure:
- Not sure where model code is run
  Rate limiting for Twitter search API is done via IP since it is not authenticated. Want API calls to made using users IP. If it runs on server, Twitter might block server for overuse