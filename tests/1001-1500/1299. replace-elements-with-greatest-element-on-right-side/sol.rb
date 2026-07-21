# @param {Integer[]} arr
# @return {Integer[]}
def replace_elements(arr)
    max_element = -1
    (arr.length - 1).downto(0) do |i|
        arr[i], max_element = max_element, [max_element, arr[i]].max
    end
    arr
end
