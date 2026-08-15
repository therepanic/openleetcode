# @param {String[]} nums
# @param {String} target
# @return {Integer}
def num_of_pairs(nums, target)
    freq = nums.tally

    total_cnt = 0

    nums.each do |num|
        if target.start_with?(num)
            remain = target[num.length..]

            if remain == num
                total_cnt += freq[remain] - 1
            else
                total_cnt += freq[remain].to_i
            end
        end
    end

    total_cnt
end
