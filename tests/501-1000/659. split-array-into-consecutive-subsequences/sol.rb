# @param {Integer[]} nums
# @return {Boolean}
def is_possible(nums)
    count = Hash.new(0)
    nums.each { |num| count[num] += 1 }
    subseq = Hash.new(0)

    nums.each do |num|
        next if count[num] == 0
        if subseq[num - 1] > 0
            subseq[num - 1] -= 1
            subseq[num] += 1
        elsif count[num + 1] > 0 && count[num + 2] > 0
            count[num + 1] -= 1
            count[num + 2] -= 1
            subseq[num + 2] += 1
        else
            return false
        end
        count[num] -= 1
    end

    true
end
