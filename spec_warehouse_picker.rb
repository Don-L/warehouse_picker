require 'minitest/autorun'
require_relative 'functions_warehouse_picker.rb'

class TestWarehouse < Minitest::Test

def test_item_at_bay()
  item = item_at_bay('b5')
  assert_equal('nail filer', item)
end



def test_bay_containing_item()
  bay = bay_containing_item('thermometer')
  assert_equal('c5', bay)
end



def test_list_of_bays()
  list = list_of_bays( ['needle', 'stop sign'] )
  assert_equal(['a1', 'a2'], list)
end



def test_list_of_items()
  list = list_of_items( ['b4', 'c5'])
  assert_equal(['photo album', 'thermometer'], list)
end



def test_inventory_index()
  index = inventory_index('c4')
  assert_equal(14, index)
end



def test_inventory_index()
  index = inventory_index('rubber duck')
  assert_equal(6, index)
end



def test_furthest_apart_bays()
  returned_array = furthest_apart_bays( ['shovel', 'face wash', 'chalk'] )
  assert_equal( ['a6', 'c6', 'c3', 11], returned_array)
end



def test_bays_in_order()
  returned_array = bays_in_order( ['paint brush', 'nail filer', 'glow stick'] )
  assert_equal( ['a9', 'c7', 'b5'], returned_array)
end



end