def is_happy(n)
  seen = {}
  until n == 1 || seen.key?(n)
    seen[n] = true
    n = next_value(n)
  end
  n == 1
end

def next_value(n)
  total = 0
  while n > 0
    digit = n % 10
    total += digit * digit
    n /= 10
  end
  total
end
