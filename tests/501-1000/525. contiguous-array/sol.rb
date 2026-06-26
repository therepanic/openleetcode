# @param {Integer[]} nums
# @return {Integer}
def find_max_length(nums)
    count = 0
    max_length = 0
    count_map = {0 => -1}

    nums.each_with_index do |num, i|
        if num == 0
            count -= 1
        else
            count += 1
        end

        if count_map.key?(count)
            max_length = [max_length, i - count_map[count]].max
        else
            count_map[count] = i
        end
    end

    max_length
end
