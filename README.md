# Mumblr

![Two young people think](app/assets/images/mumble-one.png)

> so, like, are you in to *of montreal*? i saw them at a   
> really small venue in madison back in the early aughts…

So far we have learned to create, index and show resources using a 
RESTful web interface with Rails. We've also been introduced to 
**basic user auth** (authentication/authorization).

Here is an example Rails app that implements a simple, 
**authenticated microblog**. A microblog is a web application or 
platform that allows very simple messages to be posted and shared 
(think [Twitter][tw], [Tumblr][tm] or [微博][wb]).

---

Our microblog is for young, hip people, who aren't sure what to do with
their lives. People too cool to write a lot or speak clearly. God
forbid they use correct spelling. Each of their posts is called a 
`mumble`.

Therefore the two resources our website works with are `users` and
`mumbles`. The ERD looks like:

![Mumble ERD](app/assets/images/mumbler-erd.png)

We also know how to [add validations to our models][ar-val], and how to 
[set default values in our ActiveRecord migrations][ar-mig]. Make sure 
that your models ensure these rules when saving:

- `User`: `email` must exist
- `User`: `handle` should default to "anonymous"
- `User`: `profile_image_uri`, if not given, defaults to an [anonymous
   profile image](assets/default-profile-image.jpg)
- `Mumble`: `likes` defaults to zero

![Cool kids hang out sadly](app/assets/images/mumble-two.png)

> so um... uh... whaddoyou guys think of life?..   
> like, it's really, um... hard? right?...


<!-- LINKS -->

[tw]:      https://twitter.com/?lang=en
[tm]:      https://www.tumblr.com/explore/trending
[wb]:      http://weibo.com/login?lang=en-us
[rail-cs]: /resources/cheatsheets/rails_starter.md
[boot-cs]: /resources/cheatsheets/bootstrap_cheatsheet.md
[rest-cs]: /resources/cheatsheets/rails_rest_cheatsheet.md
[ar-val]:  http://edgeguides.rubyonrails.org/active_record_validations.html#presence
[ar-mig]:  http://edgeguides.rubyonrails.org/active_record_migrations.html#column-modifiers
[ar-ref]:  http://stackoverflow.com/questions/22815009/add-a-reference-column-migration-in-rails-4
[ar-ass]:  http://edgeguides.rubyonrails.org/association_basics.html
[grav-doc]: https://en.gravatar.com/
[grav-gem]: http://guides.railsgirls.com/gravatar/
