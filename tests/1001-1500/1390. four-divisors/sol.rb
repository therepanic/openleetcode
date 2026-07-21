# @param {Integer[]} nums
# @return {Integer}
def sum_four_divisors(nums)
    return 0 if nums.empty?
    max_num = nums.max
    return 0 if max_num < 2

    sieve = Array.new(max_num + 1, true)
    sieve[0] = false if max_num >= 0
    sieve[1] = false if max_num >= 1

    p = 2
    while p * p <= max_num
        if sieve[p]
            multiple = p * p
            while multiple <= max_num
                sieve[multiple] = false
                multiple += p
            end
        end
        p += 1
    end

    total = 0
    nums.each do |x|
        # p^3 case
        p = (x ** (1.0/3)).round
        if p >= 0 && p <= max_num && p * p * p == x && sieve[p]
            total += 1 + p + p * p + x
            next
        end

        # p * q case
        i = 2
        while i * i <= x
            if x % i == 0
                j = x / i
                if i != j && i <= max_num && j <= max_num && sieve[i] && sieve[j]
                    total += 1 + i + j + x
                end
                break
            end
            i += 1
        end
    end
    total
end
