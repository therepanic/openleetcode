# @param {Integer[]} arr
# @param {Integer} m
# @return {Integer}
def find_latest_step(arr, m)
    n = arr.length
    return m if m == n
    
    groups = Array.new(n + 2, 0)
    latest_step = -1
    
    arr.each_with_index do |val, i|
        idx = val
        left = groups[idx - 1]
        right = groups[idx + 1]
        
        latest_step = i if left == m || right == m
        
        groups[idx - left] = groups[idx + right] = left + right + 1
    end
    
    latest_step
end
