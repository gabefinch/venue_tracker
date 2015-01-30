require('spec_helper')

describe (Band) do
  it {should have_and_belong_to_many (:venues)}

  it("validates that the name field is populated") do
    test_band = Band.new({:name => ""})
    expect(test_band.save()).to(eq(false))
  end

  it("capitalizes all words in the name") do
    test_band = Band.create({:name => "solar motel"})
    expect(test_band.name()).to(eq("Solar Motel"))
  end

  it("succesfully stores an already capitalized name") do
    test_band = Band.create({:name => "Television"})
    expect(test_band.name()).to(eq("Television"))
  end

end
