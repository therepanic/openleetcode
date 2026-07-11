# @param {Integer} n
# @return {Integer}
def bitwise_complement(n)
    if n == 0
        return 1
    end
    bit_length = n.bit_length
    mask = (1 << bit_length) - 1
    return n ^ mask
end
