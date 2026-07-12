# @param {Integer[]} arr
# @return {Integer[]}
def pancake_sort(arr)
    n = arr.length
    result = []
    
    (0...n).each do |i|
        target = n - i
        position = 0
        
        (0...n - i).each do |j|
            if arr[j] == target
                position = j
                break
            end
        end
        
        if position == n - i - 1
            next
        end
        
        if position > 0
            result << position + 1
            arr[0..position] = arr[0..position].reverse
        end
        
        result << n - i
        arr[0...n - i] = arr[0...n - i].reverse
    end
    
    result
end
