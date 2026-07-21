# @param {Integer[]} arr
# @return {Boolean}
def can_make_arithmetic_progression(arr)
    arr.sort!
    diff = arr[1] - arr[0]
    (0...arr.length - 1).each do |i|
        return false if arr[i+1] - arr[i] != diff
    end
    true
end
