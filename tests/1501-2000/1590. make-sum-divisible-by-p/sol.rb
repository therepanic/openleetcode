# @param {Integer[]} nums
# @param {Integer} p
# @return {Integer}
def min_subarray(nums, p)
    total = nums.sum
    target = total % p
    return 0 if target == 0

    mp = {0 => -1}
    prefix = 0
    res = nums.length

    nums.each_with_index do |x, i|
        prefix = (prefix + x) % p
        need = (prefix - target + p) % p

        if mp.key?(need)
            res = [res, i - mp[need]].min
        end

        mp[prefix] = i
    end

    res == nums.length ? -1 : res
end
