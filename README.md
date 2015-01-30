Venue Tracker
=================

by Gabe Finch

Venue Tracker keeps track of your favorite bands and lets you track what venues they have performed at.

Installation
------------

Install Expense Organizer by first cloning the repository.  
```
$ git clone http://github.com/gabefinch/venue_tracker.git
```

Install all of the required gems:
```
$ bundle install
```

Start the database:
```
$ postgres
```

Create the databases and tables by running the following:
```
$ rake db:create
$ rake db:migrate
```

Then launch your browser and go to:
```
localhost:4567/bands
```
License
-------

GNU GPL v2. Copyright 2015 Gabe Finch
