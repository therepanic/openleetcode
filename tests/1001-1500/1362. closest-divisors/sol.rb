# @param {Integer} num
# @return {Integer[]}
def closest_divisors(num)
    start = Integer.sqrt(num + 2)
    start.downto(1) do |d|
        if (num + 1) % d == 0
            return [d, (num + 1) / d]
        end
        if (num + 2) % d == 0
            return [d, (num + 2) / d]
        end
    end
    []
end
