# @param {Integer[]} nums
# @return {Integer}
def count_different_subsequence_gc_ds(nums)
    seen = nums.to_set
    maxi = nums.max
    cnt = 0
    (1..maxi).each do |i|
        gd = 0
        (i..maxi).step(i).each do |j|
            if seen.include?(j)
                gd = gd.gcd(j)
            end
        end
        cnt += 1 if gd == i
    end
    cnt
end
