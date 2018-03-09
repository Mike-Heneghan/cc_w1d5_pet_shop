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
