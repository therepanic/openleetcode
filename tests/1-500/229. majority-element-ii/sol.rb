# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
    majority1 = majority2 = count1 = count2 = 0

    nums.each do |num|
        if num == majority1
            count1 += 1
        elsif num == majority2
            count2 += 1
        elsif count1 == 0
            majority1 = num
            count1 += 1
        elsif count2 == 0
            majority2 = num
            count2 += 1
        else
            count1 -= 1
            count2 -= 1
        end
    end

    count1, count2 = 0, 0

    nums.each do |num|
        if num == majority1
            count1 += 1
        elsif num == majority2
            count2 += 1
        end
    end

    res = []
    res << majority1 if count1 > nums.length / 3
    res << majority2 if count2 > nums.length / 3

    res
end
