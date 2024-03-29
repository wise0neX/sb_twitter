Link to app:
  http://stormy-falls-7519.herokuapp.com/

About:
  Simple app to query Twitter. Type query and hit search.


Features:
- Supports all Twitter search parameters
  +except 'nearby' which has to be geo-coded manually (I guess it's possible to do that using broswer location info, but it's not a terribly important feature)
  +also results are only as good as Twitter's which are limited to at most a week past
- Attempt to make it pretty. Profile pics and some color
- rspec and guard
  test for invalid queries (too long, blank, exceptions)
  test for empty results page (try search for future tweet)


Technical:
- Twitter API accessed via 
  'twitter_search' gem (https://github.com/croaky/twitter-search)
  + heroku couldn't load it so the installation file is included in the source


Bugs:
- utf-8 (snowman) in search URL
  caused by Rails 3 patch for IE. Might be fixed by using form_for instead of form_tag in view
- "WARN Could not determine..." in server logs
  caused by Webrick gem bug. Dev says it doesn't break anything but he's working on a fix. Might be fixed by switching to Thin gem.
- Some random browser issues
  Sometimes profile pictures don't show up in Chrome. Might be a plug-in issue. Some notifications do not popup on Safari.


Unsure:
- Not sure where model code is run
  Rate limiting for Twitter search API is done via IP since it is not authenticated. Want API calls to made using users IP. If it runs on server, Twitter might block server for overuse