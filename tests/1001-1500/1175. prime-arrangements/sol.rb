$MOD = 10**9 + 7

def sieve
  prime = Array.new(101, true)
  prime[0] = false
  prime[1] = false
  (2..Math.sqrt(100).to_i).each do |i|
    if prime[i]
      (i*i..100).step(i) do |j|
        prime[j] = false
      end
    end
  end
  prime
end

def build_prefix(prime)
  prefix = Array.new(101, 0)
  (2..100).each do |i|
    prefix[i] = prefix[i-1] + (prime[i] ? 1 : 0)
  end
  prefix
end

$is_prime = sieve
$prefix_prime = build_prefix($is_prime)

# @param {Integer} n
# @return {Integer}
def num_prime_arrangements(n)
  x = $prefix_prime[n]
  y = n - x
  pro_x = 1
  pro_y = 1
  
  (2..x).each do |i|
    pro_x = (pro_x * i) % $MOD
  end
  
  (2..y).each do |i|
    pro_y = (pro_y * i) % $MOD
  end
  
  (pro_x * pro_y) % $MOD
end
