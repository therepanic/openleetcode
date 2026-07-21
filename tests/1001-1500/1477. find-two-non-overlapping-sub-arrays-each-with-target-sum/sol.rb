# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}
def min_sum_of_lengths(arr, target)
    n = arr.length
    best_left = Array.new(n, n)
    min_total = Float::INFINITY
    left = 0
    curr = 0
    arr.each_with_index do |val, right|
        curr += val
        while curr > target
            curr -= arr[left]
            left += 1
        end
        if curr == target
            length = right - left + 1
            if right > 0
                best_left[right] = [best_left[right - 1], length].min
            else
                best_left[right] = length
            end
            if left > 0 && best_left[left - 1] != n
                min_total = [min_total, best_left[left - 1] + length].min
            end
        else
            if right > 0
                best_left[right] = best_left[right - 1]
            end
        end
    end
    min_total == Float::INFINITY ? -1 : min_total
end
