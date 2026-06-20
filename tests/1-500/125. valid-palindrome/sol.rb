def is_palindrome(s)
  filtered = s.each_char.select { |c| c =~ /[[:alnum:]]/ }.map(&:downcase)
  filtered == filtered.reverse
end
