# @param {Integer[]} nums
# @return {Integer}
def special_array(nums)
    ans = []
    (0..nums.length).each do |i|
        count = 0
        nums.each do |ele|
            count += 1 if i <= ele
        end
        ans << count
        return i if ans[i] == i
    end
    -1
end
