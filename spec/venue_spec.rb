require('spec_helper')

describe (Venue) do

  it {should have_and_belong_to_many (:bands)}

  it("validates that the name field is populated") do
    test_venue = Venue.new({:name => ""})
    expect(test_venue.save()).to(eq(false))
  end

  it("capitalizes all words in the name") do
    test_venue = Venue.create({:name => "x-ray cafe"})
    expect(recipe.name()).to(eq("X-ray Cafe"))
  end

  it("capitalizes all words in the location") do
    test_venue = Venue.create({:name => "X-ray Cafe", :location => "1234 w. burnside st."})
    expect(recipe.location()).to(eq("1234 W. Burnside St."))
  end

  describe('.five_star') do
    it('returns all 5-star rated venues') do
    test_venue1 = Venue.create({:name => "La Luna", :rating => 5})
    test_venue2 = Venue.create({:name => "Tonic Lounge", :rating => 0})
    expect(Venue.five_star()).to(eq([test_venue1]))
    end
  end
end
