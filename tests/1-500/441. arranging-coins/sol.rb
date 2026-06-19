# @param {Integer} n
# @return {Integer}
def arrange_coins(n)
    ((Math.sqrt(8 * n + 1) - 1) / 2).to_i
end
