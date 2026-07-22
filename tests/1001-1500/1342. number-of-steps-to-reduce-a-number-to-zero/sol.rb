# @param {Integer} num
# @return {Integer}
def number_of_steps(num)
    return 0 if num == 0
    num.bit_length - 1 + num.to_s(2).count('1')
end
