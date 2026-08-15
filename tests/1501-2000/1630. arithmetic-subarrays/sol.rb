# @param {Integer[]} nums
# @param {Integer[]} l
# @param {Integer[]} r
# @return {Boolean[]}
def check_arithmetic_subarrays(nums, l, r)
    ans = []
    l.each_with_index do |left, i|
        right = r[i]
        sub = nums[left..right].sort
        if sub.length <= 2
            ans << true
        else
            d = sub[1] - sub[0]
            valid = true
            (1...sub.length-1).each do |j|
                if sub[j+1] - sub[j] != d
                    valid = false
                    break
                end
            end
            ans << valid
        end
    end
    ans
end
