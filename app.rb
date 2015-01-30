require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  Band.create({ :name => params['name'] })
  redirect back
end
