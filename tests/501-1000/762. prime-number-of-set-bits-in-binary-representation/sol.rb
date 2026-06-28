# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def count_prime_set_bits(left, right)
    primes = [2, 3, 5, 7, 11, 13, 17, 19]
    count = 0
    (left..right).each do |i|
        set_bits = popcount(i)
        count += 1 if primes.include?(set_bits)
    end
    count
end

def popcount(n)
    count = 0
    while n > 0
        n &= n - 1
        count += 1
    end
    count
end
