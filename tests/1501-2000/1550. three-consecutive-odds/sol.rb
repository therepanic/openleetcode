# @param {Integer[]} arr
# @return {Boolean}
def three_consecutive_odds(arr)
    arr.map { |x| x & 1 }.join.include?('111')
end
