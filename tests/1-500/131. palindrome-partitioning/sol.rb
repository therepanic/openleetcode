def partition(s)
  result = []
  path = []
  is_palindrome = lambda do |left, right|
    while left < right
      return false if s[left] != s[right]
      left += 1
      right -= 1
    end
    true
  end
  backtrack = lambda do |index|
    if index == s.length
      result << path.dup
      next
    end
    (index...s.length).each do |ending|
      if is_palindrome.call(index, ending)
        path << s[index..ending]
        backtrack.call(ending + 1)
        path.pop
      end
    end
  end
  backtrack.call(0)
  result
end
