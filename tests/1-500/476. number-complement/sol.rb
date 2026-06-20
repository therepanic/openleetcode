# @param {Integer} num
# @return {Integer}
def find_complement(num)
    bit = 1
    curr = num
    while curr > 0
        num ^= bit
        bit <<= 1
        curr >>= 1
    end
    num
end
