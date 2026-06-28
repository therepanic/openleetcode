# @param {Integer[]} nums
# @return {Integer}
def dominant_index(nums)
    m = -1
    s = -1
    idx = -1
    nums.each_with_index do |x, i|
        if x > m
            s = m
            m = x
            idx = i
        elsif x > s
            s = x
        end
    end
    m >= s * 2 ? idx : -1
end
