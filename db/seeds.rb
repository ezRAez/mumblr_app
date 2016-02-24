
# Clean out all current data ###########################################

Comment.delete_all
Mumble.delete_all
User.delete_all

# Create users #########################################################

garfield = User.create(
  email:                 "bob.garfield@gmail.com",
  handle:                "garfield minus morality",
  profile_image_uri:     "/images/seeds/profile-garf.jpg",
  password:              "123",
  password_confirmation: "123"
)
harper = User.create(
  email:                 "harper.reilly@mac.com",
  handle:                "harper",
  password:              "123",
  password_confirmation: "123"
)
portland = User.create(
  email:                 "people-power@no-dams.org",
  handle:                "Concerned Portland Citizen",
  profile_image_uri:     "/images/seeds/profile-bike.png",
  password:              "123",
  password_confirmation: "123"
)
eugenius = User.create(
  email:                 "k.eugenio+nospam@eugenius.ca",
  handle:                "eugenius",
  profile_image_uri:     "/images/seeds/profile-eug.jpg",
  password:              "123",
  password_confirmation: "123"
)
beardo = User.create(
  email:                 "beardo@irony.com",
  handle:                "BE♥RDZ",
  profile_image_uri:     "/images/seeds/profile-beardo.jpg",
  password:              "123",
  password_confirmation: "123"
)

# Create mumbles / posts for the users #################################

g1 = garfield.mumbles.create(image_uri: "/images/seeds/gmm-01.png")
g2 = garfield.mumbles.create(image_uri: "/images/seeds/gmm-02.png")
g3 = garfield.mumbles.create(image_uri: "/images/seeds/gmm-03.png")

h1 = harper.mumbles.create(
  image_uri: "/images/seeds/food-burrito.jpg",
  tags:      "#lunchtime #ramenburrito"
)
h2 = harper.mumbles.create(
  image_uri: "/images/seeds/food-pho.jpg",
  tags:      "#bonemarrowpho #meencanta"
)
h3 = harper.mumbles.create(
  image_uri: "/images/seeds/food-tacos.jpg",
  tags:      "#ilovela #diversity #tacothursday"
)

p1 = portland.mumbles.create(
  text: "<p>To Whom it May Concern,</p>

<p>Complaining about the weather is a form
of climate change denial. If you want
more sun then just keep driving your
Volkswagens or move to LA. I'm just saying,
hypocrisy is a very unattractive trait.</p>

<p>Sincerely,<br>
Concerned Portland Citizen</p>
",
  tags: "#chemtrailsare4real"
)
p2 = portland.mumbles.create(
  text: "
<p>Dear Editorial Board of the Portland Mercury,</p>

<p>While I enjoy a good joke as much as the
next Portlander, your 'henhouse' reference
strikes me as enforcing patriarchy, not as
mocking it. Also, raising chickens for
their eggs is both animal cruelty and a
form of incarceration.</p>

<p>Sincerely,<br>
Concerned Portland Citizen</p>
",
  tags: "#raisingtheroost"
)

e1 = eugenius.mumbles.create(
  text:      "Clouds.",
  image_uri: "/images/seeds/eug-clouds.jpg",
  tags:      "#flight"
)
e2 = eugenius.mumbles.create(
  text:      "Thinking about time, and what it does to us…",
  image_uri: "/images/seeds/eug-hills.jpg",
  tags:      "#usa #longdistancedrive"
)
e3 = eugenius.mumbles.create(
  text:      "Sometimes I miss being a kid!",
  image_uri: "/images/seeds/eug-sea.jpg",
  tags:      "#forever"
)
e4 = eugenius.mumbles.create(
  text:      "Just sitting around at home.",
  image_uri: "/images/seeds/eug-knap.jpg",
  tags:      "#grounded #texture"
)
e5 = eugenius.mumbles.create(
  text:      "Old friends and monuments…",
  image_uri: "/images/seeds/eug-wmata.jpg",
  tags:      "#grounded #texture"
)

b1 = beardo.mumbles.create(
  image_uri: "/images/seeds/beard-micah.jpg",
  tags:      "#nicebeard"
)
b2 = beardo.mumbles.create(
  image_uri: "/images/seeds/beard-andrew.jpg",
  tags:      "#nicebeard"
)

## Set created at datetimes for ordering... ############################

h2.update created_at: h2.created_at.advance(days:  0, hours: -2)
e2.update created_at: e2.created_at.advance(days:  0, hours: -4)
g1.update created_at: g1.created_at.advance(days:  0, hours: -6)
e4.update created_at: e4.created_at.advance(days:  0, hours: -8)
p1.update created_at: p1.created_at.advance(days:  0, hours: -10)
e5.update created_at: e5.created_at.advance(days:  0, hours: -12)
b2.update created_at: b2.created_at.advance(days:  0, hours:  0)
g2.update created_at: g2.created_at.advance(days: -1, hours: -2)
e1.update created_at: e1.created_at.advance(days: -1, hours: -4)
b1.update created_at: b1.created_at.advance(days: -1, hours: -6)
h3.update created_at: h3.created_at.advance(days: -1, hours: -8)
g3.update created_at: g3.created_at.advance(days: -1, hours: -10)
h1.update created_at: h1.created_at.advance(days: -1, hours: -12)
e3.update created_at: e3.created_at.advance(days: -2, hours:  0)
p2.update created_at: p2.created_at.advance(days: -2, hours: -2)
