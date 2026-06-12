def count_primes(n)
  return 0 if n <= 2
  is_prime = Array.new(n, true)
  is_prime[0] = is_prime[1] = false
  i = 2
  while i * i < n
    if is_prime[i]
      j = i * i
      while j < n
        is_prime[j] = false
        j += i
      end
    end
    i += 1
  end
  is_prime.count(true)
end
