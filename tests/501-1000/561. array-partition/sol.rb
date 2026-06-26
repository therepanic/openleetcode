# @param {Integer[]} nums
# @return {Integer}
def array_pair_sum(nums)
    bucket = Array.new(20001, 0)
    nums.each { |x| bucket[x + 10000] += 1 }
    res = 0
    flag = true
    (0...20001).each do |i|
        while bucket[i] > 0
            if flag
                res += i - 10000
            end
            flag = !flag
            bucket[i] -= 1
        end
    end
    res
end
