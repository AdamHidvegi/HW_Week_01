def pet_shop_name(pet_shop)
  return pet_shop[:name]
end
#---------------
def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end
#---------------
def add_or_remove_cash(pet_shop, amount)
  if (amount >= 0)
    pet_shop[:admin][:total_cash] += amount
  elsif (amount < 0)
    pet_shop[:admin][:total_cash] += amount
  else
    return p "something is wrong."
  end
end
#---------------
def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end
#---------------
def increase_pets_sold(pet_shop, amount)
  return pet_shop[:admin][:pets_sold] += amount
end
#---------------
def stock_count(pet_shop)
  return pet_shop[:pets].length()
end
#---------------
def pets_by_breed(pet_shop, breed)
  breed_count = []
  for pet in pet_shop[:pets]
      if pet[:breed] == breed
        breed_count.push(pet)
      end
  end
  return breed_count
end
#---------------
def find_pet_by_name(pet_shop, pet)
  for pets in pet_shop[:pets]
    if pets[:name] == pet
      return pets
    end
  end
  return nil
end
#---------------
def remove_pet_by_name(pet_shop, pet_name)
  for pets in pet_shop[:pets]
    if pets[:name] == pet_name
      pets.shift
    end
  end
  find_pet_by_name(pet_shop, pet_name)
  return nil
end
#---------------
def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
  stock_count(pet_shop)
    return pet_shop[:pets].length()
end
#---------------
def customer_cash(customer)
  return customer[:cash]
end
#---------------
def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end
#---------------
def customer_pet_count(customer)
  return customer[:pets].length()
end
#---------------
def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
  customer_pet_count(customer)
end

#------------ OPTIONAL ---------------|

def customer_can_afford_pet(customer, new_pet)
    if customer[:cash] >= new_pet[:price]
      return true
    else
      return false
    end
end
#---------------
def sell_pet_to_customer(pet_shop, pet, customer)
  find_pet_by_name(pet_shop, pet)

  if pet_shop[:pets].include? pet
    if customer[:cash] >= pet[:price]
      customer[:pets].push(pet)
      pet_shop[:admin][:pets_sold] += 1
      customer[:cash] -= pet[:price]
      pet_shop[:admin][:total_cash] += pet[:price]
    end
  end

  customer_pet_count(customer)
  pets_sold(pet_shop)
  customer_cash(customer)
  total_cash(pet_shop)
end
