# @param {Integer[]} nums
# @return {Integer}
def count_triplets(nums)
    most = nums.max
    return nums.length ** 3 if most == 0
    
    bits = Math.log2(most).ceil + 1
    n = 1 << bits
    
    c = Array.new(n, 0)
    nums.each { |num| c[num] += 1 }
    
    h = 1
    while h < n
        (0...n).step(2*h) do |s|
            (s...s+h).each { |i| c[i] += c[i+h] }
        end
        h *= 2
    end
    
    (0...n).each { |i| c[i] = c[i] ** 3 }
    
    h = 1
    while h < n
        (0...n).step(2*h) do |s|
            (s...s+h).each { |i| c[i] -= c[i+h] }
        end
        h *= 2
    end
    
    c[0]
end
