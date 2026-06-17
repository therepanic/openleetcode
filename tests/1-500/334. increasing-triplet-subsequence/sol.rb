# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
    a = Float::INFINITY
    b = Float::INFINITY
    f = false
    nums.each do |x|
        if x <= a
            a = x
        elsif x <= b
            b = x
        else
            f = true
        end
    end
    f
end
