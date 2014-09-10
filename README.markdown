Gatling Gun
===========

Gatling Gun is a library that helps you blast out a group of emails.  It's a
simple wrapper over
[SendGrid's Newsletter API](http://docs.sendgrid.com/documentation/api/newsletter-api/).

Install
-------

If you want to use this code in a Rails application, just add it to your
Gemfile:

```ruby
gem "gatling_gun"
```

Then require the library in your code:

```ruby
require "gatling_gun"
```

You will probably want to setup Gatling Gun as your application loads.  I
recommend just setting a constant you can then refer to throughout your
application.  In Rails, I would put the following code in
`config/initializers/gatling_gun.rb`.  Setup is easy, just add you SendGrid
credentials:

```ruby
SendGrid = GatlingGun.new("USERNAME", "PASSWORD")
```

Usage
-----

The minimal steps to create and send a newsletter would be something like the
following.  First, you need an identity to send from:

```ruby
    SendGrid.add_identity( "test", name:    "Test User",
                                   email:   "test@subinterest.com",
                                   address: "513 Cinnamon Dr.",
                                   city:    "Edmond",
                                   state:   "OK",
                                   zip:     "73003",
                                   country: "USA" )
```

Then you can create a newsletter using that identity:

```ruby
    SendGrid.add_newsletter( "episode1", identity: "test",
                                         subject:  "Episode 1",
                                         text:     "The Text Body",
                                         html:     "<h1>The HTML Body</h1>" )
```

Next you need to create a list of recipients, add some emails to it, and attach 
that list to the newsletter:

```ruby
    SendGrid.add_list("subscribers")
    SendGrid.add_emails( "subscribers", [ { name:  "James Edward Gray II",
                                            email: "james@graysoftinc.com" },
                                          { name:  "Admin",
                                            email: "admin@graysoftinc.com" } ] )
    SendGrid.add_recipients("episode1", "subscribers")
```

Of course, you could reuse identities and recipient lists for future newsletter
messages without needing to recreate them.

Finally, you can schedule when to have the message sent:

```ruby
    SendGrid.add_schedule("episode1", at: Time.now + 10 * 60)
```

That would sent it 10 minutes from now, but you can adjust the time to whenever
you desire or even leave it out to send now.
