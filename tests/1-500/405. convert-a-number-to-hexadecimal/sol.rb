# @param {Integer} num
# @return {String}
def to_hex(num)
    return "0" if num == 0
    num += 2**32 if num < 0
    h = "0123456789abcdef"
    r = []
    while num > 0
        r << h[num & 15]
        num /= 16
    end
    r.reverse.join
end
