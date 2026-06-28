# @param {Integer[]} bits
# @return {Boolean}
def is_one_bit_character(bits)
    n, i = bits.length, 0
    while i < n - 1
        i += 1 + (bits[i] == 1 ? 1 : 0)
    end
    i == n - 1
end
