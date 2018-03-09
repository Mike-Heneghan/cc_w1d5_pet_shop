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
    if pets[:name] == name
      name_found[:name] = name
    end
  end
  return name_found unless name_found.empty?
end

def remove_pet_by_name(petshop, name)
 find_pet_by_name(petshop, name)
  for pets in petshop[:pets]
    if pets[:name] == name
      i = petshop[:pets][:name]
    # p  number = petshop[:pets].index(i)
      # petshop[:pets].delete_at(number)
    end
  end
  return petshop[:pets]
end
