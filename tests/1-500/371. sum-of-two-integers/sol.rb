# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def get_sum(a, b)
    a &= 0xffffffff
    b &= 0xffffffff
    while b != 0
        c = (a & b) << 1
        a = (a ^ b) & 0xffffffff
        b = c & 0xffffffff
    end
    return a < 0x80000000 ? a : ~(a ^ 0xffffffff)
end
