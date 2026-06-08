def longest_valid_parentheses(s)
  stack = [-1]
  ans = 0
  s.each_char.with_index do |ch, i|
    if ch == '('
      stack << i
    else
      stack.pop
      if stack.empty?
        stack << i
      else
        ans = [ans, i - stack[-1]].max
      end
    end
  end
  ans
end
