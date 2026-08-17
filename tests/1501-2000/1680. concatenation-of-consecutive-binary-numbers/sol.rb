# @param {Integer} n
# @return {Integer}
def concatenated_binary(n)
    mod = 10**9 + 7
    res = 0
    bits = 0

    (1..n).each do |i|
        if (i & (i-1)) == 0
            bits += 1
        end
        res = ((res << bits) | i) % mod
    end

    res
end
