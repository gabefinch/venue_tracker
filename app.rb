require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/bands') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:bands)
end

post('/bands') do
  Band.create({ :name => params['name'] })
  redirect back
end

get('/bands/:id') do
  @band = Band.find(params['id'])
  erb(:band)
end

get('/bands/:id/update') do
  @band = Band.find(params['id'])
  @venues = Venue.all()
  erb(:band_update)
end

patch('/bands/:id') do
  id = params['id']
  band = Band.find(id)
  band.update({ :name => params['name'], :style => params['style'], :hometown => params['hometown']})
  if (params['venue_ids'] != nil)
    if (params['venue_ids'].length() != 0)
      params['venue_ids'].each do |venue_id|
        venue = Venue.find(venue_id)
        band.venues.push(venue)
      end
    end
  end
  redirect('/bands/' + id.to_s())
end

delete ('/bands/:id') do
  id = params['id']
  band = Band.find(id)
  band.destroy()
  redirect('/bands')
end

get('/venues/:id') do
  @venue = Venue.find(params['id'])
  erb(:venue_update)
end

post('/venues') do
  Venue.create({ :name => params['name'] })
  redirect back
end

patch('/venues/:id') do
  id = params['id']
  venue = Venue.find(id)
  venue.update({ :name => params['name'], :address => params['address'], :rating => params['rating']})
  redirect ('/bands')
end

delete('/venues/:id') do
  venue = Venue.find(params['id'])
  venue.destroy()
  redirect ('/bands')
end
