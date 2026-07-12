# @param {Integer[]} nums
# @return {Integer}
def largest_component_size(nums)
    def get_prime_factors(n)
        s = Set.new
        while n % 2 == 0
            s.add(2)
            n /= 2
        end
        i = 3
        while i * i <= n
            while n % i == 0
                s.add(i)
                n /= i
            end
            i += 2
        end
        s.add(n) if n > 2
        s.to_a
    end

    n = nums.length
    root = (0...n).to_a
    rank = [1] * n

    define_method(:find) do |x|
        while root[x] != x
            root[x] = root[root[x]]
            x = root[x]
        end
        x
    end

    define_method(:union) do |x, y|
        rx = find(x)
        ry = find(y)
        return if rx == ry
        if rank[rx] > rank[ry]
            root[ry] = rx
        elsif rank[rx] < rank[ry]
            root[rx] = ry
        else
            root[ry] = rx
            rank[rx] += 1
        end
    end

    prime_to_idx = {}
    nums.each_with_index do |num, i|
        primes = get_prime_factors(num)
        primes.each do |p|
            if prime_to_idx.key?(p)
                union(prime_to_idx[p], i)
            end
            prime_to_idx[p] = i
        end
    end

    count = Hash.new(0)
    (0...n).each do |i|
        count[find(i)] += 1
    end

    count.values.max
end
