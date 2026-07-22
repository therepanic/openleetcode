# @param {Integer} num_bottles
# @param {Integer} num_exchange
# @return {Integer}
def num_water_bottles(num_bottles, num_exchange)
    num_bottles + (num_bottles - 1) / (num_exchange - 1)
end
