# @param {Integer[]} arr
# @return {Integer}
def maximum_sum(arr)
    n = arr.length
    return arr[0] if n == 1
    
    max_no_delete = arr[0]
    max_one_delete = arr[0]
    result = arr[0]
    
    (1...n).each do |i|
        prev_no_delete = max_no_delete
        max_no_delete = [max_no_delete + arr[i], arr[i]].max
        max_one_delete = [max_one_delete + arr[i], prev_no_delete].max
        result = [result, max_no_delete, max_one_delete].max
    end
    
    result
end
