# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer[]}
def get_strongest(arr, k)
    arr.sort!
    m = arr[(arr.length - 1) / 2]
    
    left = 0
    right = arr.length - 1
    result = []
    k.times do
        if (arr[right] - m).abs >= (arr[left] - m).abs
            result << arr[right]
            right -= 1
        else
            result << arr[left]
            left += 1
        end
    end
    result
end
