class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  before_save(:capitalize_name_address)
  scope(:five_star, -> do
    where ({:rating => 5})
  end)

private
  define_method(:capitalize_name_address) do
    name_words = []
    self.name.split(' ').each do |word|
      name_words.push(word.capitalize())
    end
    self.name = name_words.join(' ')
    if self.address != nil
      address_words = []
      self.address.split(' ').each do |word|
        address_words.push(word.capitalize())
      end
      self.address = address_words.join(' ')
    end
  end
end
