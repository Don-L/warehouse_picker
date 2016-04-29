# I chose to represent the warehouse as a hash, with adjacent key value pairs 
# representing adjacent bays in the warehouse.  I've done some reading since
# then and found that this is probably an abuse of the Hash class, as hashes
# are supposed to be used for unordered data!  If I was to do this again
# I'd maybe try using an array of arrays, like
# INVENT = [[1, 'a10', 'rubber band'], [2, 'a9', 'glow stick'] etc].

INVENT = {                          # inventory {bay number => item}
          'a10' => 'rubber band',
          'a9'  => 'glow stick',
          'a8'  => 'model car',
          'a7'  => 'bookmark',
          'a6'  => 'shovel',
          'a5'  => 'rubber duck',
          'a4'  => 'hanger',
          'a3'  => 'blouse',
          'a2'  => 'stop sign',
          'a1'  => 'needle',
          'c1'  => 'rusty nail',
          'c2'  => 'drill press',
          'c3'  => 'chalk',
          'c4'  => 'word search',
          'c5'  => 'thermometer',
          'c6'  => 'face wash',
          'c7'  => 'paint brush',
          'c8'  => 'candy wrapper',
          'c9'  => 'shoe lace',
          'c10' => 'leg warmers',
          'b1'  => 'tyre swing',
          'b2'  => 'sharpie',
          'b3'  => 'picture frame',
          'b4'  => 'photo album',
          'b5'  => 'nail filer',
          'b6'  => 'tooth paste',
          'b7'  => 'bath fizzers',
          'b8'  => 'tissue box',
          'b9'  => 'deodorant',
          'b10' => 'cookie jar',
         }



# given a bay number returns the name of the item held in the bay

def item_at_bay(bay)
  return INVENT[bay]
end



# given an item name returns the corresponding bay number

def bay_containing_item(item)
  return INVENT.key(item)
end



# given a list of item names returns a list of the corresponding bay number

def list_of_bays(list_of_items)
  list_of_bays = []
  for item in list_of_items
    result = bay_containing_item(item)
    list_of_bays.push(result)
  end
  return list_of_bays
end



# given a list of bay numbers returns a list of the corresponding item names

def list_of_items(list_of_bays)
  list_of_items = []
  for bay in list_of_bays
    result = item_at_bay(bay)
    list_of_items.push(result)
  end
  return list_of_items
end



# given a bay number or item name returns the position of the corresponding key
# value pair in the INVENT hash

def inventory_index(bay_or_item)
  if INVENT.keys.include?(bay_or_item) == true
    return INVENT.keys.index(bay_or_item) + 1
  else return INVENT.values.index(bay_or_item) + 1
  end
end    # +1 added to the returned index to help with a calculation carried out
       # in the next function.  This messed a bit with the final function...



# given a list of items returns a list showing the bays containing the items,
# and the distance in bays between the two bays that are furthest apart

def furthest_apart_bays(list_of_items)
 list_of_bays_and_max_separation = list_of_bays(list_of_items)
 indices = []
 for bay in list_of_bays_and_max_separation
  index = inventory_index(bay)
  indices.push(index)
 end
 max_separation = indices.max - indices.min
 return list_of_bays_and_max_separation.push(max_separation)
end



# given a list of items determines which bays they need to be collected from
# in order from entrance to exit

def bays_in_order(list_of_items)
  list = list_of_bays(list_of_items)  #gets unordered list of bays
  indices = []
  for item in list
    index = inventory_index(item)
    indices.push(index)   #gets unordered list of bay indices
  end
  indices = indices.sort  #sorts the list of indices
  bays_in_order = []
  for index in indices
    bays_in_order.push(INVENT.keys[index - 1])  #gets sorted list of bays
  end
  return bays_in_order
end