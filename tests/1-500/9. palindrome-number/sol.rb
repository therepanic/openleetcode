def is_palindrome(x)
  return false if x < 0

  rev = 0
  num = x

  while num != 0
    rev = rev * 10 + (num % 10)
    num /= 10
  end

  rev == x
end
