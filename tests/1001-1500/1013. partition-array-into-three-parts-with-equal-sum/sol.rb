# @param {Integer[]} arr
# @return {Boolean}
def can_three_parts_equal_sum(arr)
    total = arr.sum
    return false if total % 3 != 0
    target = total / 3
    current_sum = 0
    partitions = 0
    arr.each_with_index do |num, i|
        current_sum += num
        if current_sum == target
            partitions += 1
            current_sum = 0
            if partitions == 2 && i < arr.length - 1
                return true
            end
        end
    end
    false
end
