# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def get_winner(arr, k)
    candidate = arr[0]
    streak = 0
    (1...arr.length).each do |i|
        if candidate > arr[i]
            streak += 1
        else
            candidate = arr[i]
            streak = 1
        end
        return candidate if streak == k
    end
    candidate
end
