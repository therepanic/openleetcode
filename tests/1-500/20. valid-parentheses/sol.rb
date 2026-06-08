def is_valid(s)
  stack = []
  s.each_char do |ch|
    if ch == '(' || ch == '[' || ch == '{'
      stack << ch
    else
      return false if stack.empty?
      top = stack.pop
      return false if ch == ')' && top != '('
      return false if ch == ']' && top != '['
      return false if ch == '}' && top != '{'
    end
  end
  stack.empty?
end
