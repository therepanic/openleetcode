# @param {Integer[]} arr
# @param {Integer} m
# @param {Integer} k
# @return {Boolean}
def contains_pattern(arr, m, k)
    (0..(arr.length - m * k)).each do |i|
        match = true
        (0...(m * (k - 1))).each do |j|
            if arr[i + j] != arr[i + j + m]
                match = false
                break
            end
        end
        return true if match
    end
    false
end
