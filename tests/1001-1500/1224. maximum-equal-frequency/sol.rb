# @param {Integer[]} nums
# @return {Integer}
def max_equal_freq(nums)
    counts = Hash.new(0)
    frequency_counts = Hash.new(0)
    best = 0

    nums.each_with_index do |value, i|
        index = i + 1
        previous = counts[value]
        if previous != 0
            frequency_counts[previous] -= 1
            if frequency_counts[previous] == 0
                frequency_counts.delete(previous)
            end
        end
        counts[value] = previous + 1
        frequency = previous + 1
        frequency_counts[frequency] = (frequency_counts[frequency] || 0) + 1

        if frequency_counts.length == 1
            only_frequency, value_count = frequency_counts.first
            if only_frequency == 1 || value_count == 1
                best = index
            end
        elsif frequency_counts.length == 2
            low, high = frequency_counts.keys.sort
            if (low == 1 && frequency_counts[low] == 1) || (high == low + 1 && frequency_counts[high] == 1)
                best = index
            end
        end
    end

    best
end
