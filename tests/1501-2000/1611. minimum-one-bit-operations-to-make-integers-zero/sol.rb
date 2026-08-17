# @param {Integer} n
# @return {Integer}
def minimum_one_bit_operations(n)
    highest = 0
    (0...32).each do |i|
        if n & (1 << i) != 0
            highest = i
        end
    end

    ans = 0
    add = true
    highest.downto(0) do |i|
        if n & (1 << i) != 0
            val = (1 << (i + 1)) - 1
            if add
                ans += val
            else
                ans -= val
            end
            add = !add
        end
    end

    ans
end
