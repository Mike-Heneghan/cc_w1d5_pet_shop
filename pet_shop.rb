# Functions file to be tested by pet_shop_spec.rb

def pet_shop_name(name)
  name[:name]
end

def total_cash(name)
  return name[:admin][:total_cash]
end

def add_or_remove_cash(shop,value)
  shop[:admin][:total_cash] += value
end

def pets_sold(shop)
  shop[:admin][:pets_sold]
end

def increase_pets_sold(shop,number)
  shop[:admin][:pets_sold] += number
end

def stock_count(shop)
  shop[:pets].length
end

def pets_by_breed(petshop,type)
  # need to create an array of the pets of the same breed.
  # need the pet names in an array found from their value.
  # could be worth having a for loop to search.
  desired = []
    for pets in petshop[:pets]
      if pets[:breed] == type then desired.push(pets[:name])
      end
    end
    return desired
end

def find_pet_by_name(petshop, name)
  name_found = Hash.new
  for pets in petshop[:pets]
    if pets[:name] == name then name_found.merge!(pets)
    end
  end
  return name_found unless name_found.empty?
end

def remove_pet_by_name(petshop, name)
 pet_remove = find_pet_by_name(petshop, name)
 petshop[:pets].delete(pet_remove)
end

#  As the test for remove_pet_by_name requires the whole pet hash it was neccessary to modufy the method to return the full hash not just the :name => "name".
# When running the find_pet_by_name method the result is the full hash for that pet i.e. { name: "Arthur", pet_type: :dog, breed: "Husky", price: 900 }
# The .delete method on petshop[pets] removes the pet and it's details from the resultant array of hashes.

def add_pet_to_stock(petshop, new_pet)
  petshop[:pets].push(new_pet)
end
