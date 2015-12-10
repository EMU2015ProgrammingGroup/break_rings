def python_to_ruby_array(inputstring)	#usage: python_to_ruby_array("({1,2},{2,3})")
  return eval(inputstring.gsub(/[\({]/,'[').gsub(/[\)}]/,']'))	#returns a Ruby array e.g. [[1,2],[2,3]]
end

def break_rings(links)
  return 0 if links == [[]]	# no breaks are needed if no rings are connected
  rings = links.flatten.uniq	# array of ring numbers (e.g. [1,2,3])
  connected = true	# variable for while loop
  breaks = 0	# output variable
  while connected
    for breakpattern in rings.combination(breaks += 1) do	# increments breaks by 1, then goes through every combination of rings with length (breaks)
      connected = (links.collect{|link| (link - breakpattern).length}.include?(2))	# goes through all elements in links and subtracts breakpattern from each one (e.g. [1,2] - [2] == [1] or [1,2] - [1,2,3] == []), takes length of result, and sets connected to whether any elements with length 2 (pairs of rings) remain
      break if not(connected)	# exits for loop if a working break pattern is found; prevents connected from being set back to false
    end
  end
  return breaks
end

# break_rings(python_to_ruby_array("({1, 2}, {2, 3}, {3, 4}, {4, 5}, {5, 6}, {4, 6})")) == 3
# break_rings(python_to_ruby_array("({1, 2}, {1, 3}, {1, 4}, {2, 3}, {2, 4}, {3, 4})")) == 3
# break_rings(python_to_ruby_array("({5, 6}, {4, 5}, {3, 4}, {3, 2}, {2, 1}, {1, 6})")) == 3
# break_rings(python_to_ruby_array("({8, 9}, {1, 9}, {1, 2}, {2, 3}, {3, 4}, {4, 5}, {5, 6}, {6, 7}, {8, 7})")) == 5
# ^these all will return true

# you can test this on, say, codepad.org by uncommenting either of the following lines and replacing the input with your own
# puts break_rings(python_to_ruby_array("({1, 2}, {2, 3}, {3, 4}, {4, 5}, {5, 6}, {4, 6})"))
# puts break_rings([[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [4, 6]])
