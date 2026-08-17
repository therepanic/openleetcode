# @param {Integer[]} arr
# @return {Integer}
def maximum_element_after_decrementing_and_rearranging(arr)
    arr.sort!
    arr[0] = 1
    (1...arr.length).each do |i|
        arr[i] = [arr[i], arr[i-1] + 1].min
    end
    arr[-1]
end
