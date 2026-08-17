# @param {String} num
# @param {Integer} k
# @return {Integer}
def get_min_swaps(num, k)
    arr = num.chars
    target = num.chars
    
    k.times do
        next_permutation(target)
    end
    
    swaps = 0
    arr = num.chars
    
    (0...arr.length).each do |i|
        next if arr[i] == target[i]
        
        j = i
        while arr[j] != target[i]
            j += 1
        end
        
        while j > i
            arr[j], arr[j - 1] = arr[j - 1], arr[j]
            j -= 1
            swaps += 1
        end
    end
    
    swaps
end

def next_permutation(arr)
    i = arr.length - 2
    while i >= 0 && arr[i] >= arr[i + 1]
        i -= 1
    end
    return false if i == -1
    
    j = arr.length - 1
    while arr[j] <= arr[i]
        j -= 1
    end
    
    arr[i], arr[j] = arr[j], arr[i]
    arr[i + 1..] = arr[i + 1..].reverse
    true
end
