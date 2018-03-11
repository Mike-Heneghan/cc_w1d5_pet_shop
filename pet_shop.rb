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

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  return true if customer[:cash] >= new_pet[:price] || customer[:cash] == new_pet
  return false if customer[:cash] <= new_pet[:price]
end

def sell_pet_to_customer(petshop, pet , customer)
  # Can the pet be found?
    if pet != nil
      # Can the customer afford the pet?
      afford = customer_can_afford_pet(customer, pet)
      if afford == true
         # Add it to his pets hash, decrease his cash balance.
         add_pet_to_customer(customer, pet)
         customer[:cash] -= pet[:price]
         # Remove it from the petshop stock
         remove_pet_by_name(petshop, pet[:name])
         # Add pet sale value to petshop balance
         value = pet[:price]
         add_or_remove_cash(petshop, value)
         # Add to pets sold
         increase_pets_sold(petshop,1)
       elsif afford == false
         return nil
       end
    end
end
  # If the customer can afford
    # Add it to his pets hash, decrease his cash balance.
    # Remove it from the petshop stock
  # If the customer cannot afford the pet
    # reject the sale
