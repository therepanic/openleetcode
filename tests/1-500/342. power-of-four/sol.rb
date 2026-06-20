# @param {Integer} n
# @return {Boolean}
def is_power_of_four(n)
    n > 0 && n.bit_length != 0 && n & (n - 1) == 0 && (n - 1) % 3 == 0
end
