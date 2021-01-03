# Blogzilla

This is a simple blog with comments and likes. It uses Rails, MongoDB, Mongoid, and KnockoutJS

### Setup:

This uses Ruby 2.6.3, Rails 6.0.3 and MongoDB Community 4.2. Once your environment is configured and the repo cloned, run:
```
bundle install
```

To run the server on localhost:3000, run:
`rails s`

To run the tests, run:
`rspec`

To enter the Rails console, run:
`rails c`

### Features

This app allows visitors to view and create blog posts, and comment on or like other blog posts. Posts and comments are stored in MongoDB. The like counter is incremented using KnockoutJS without waiting for the page to reload.
