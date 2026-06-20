# @param {Integer} a
# @param {Integer[]} b
# @return {Integer}
def super_pow(a, b)
    a %= 1337
    b.reduce(1) { |r, d| (r.pow(10, 1337) * a.pow(d, 1337)) % 1337 }
end
