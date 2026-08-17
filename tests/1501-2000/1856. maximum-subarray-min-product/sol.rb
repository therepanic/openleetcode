def max_sum_min_product(nums)
    n = nums.size
    prefix = [0] * (n + 1)
    (0...n).each { |i| prefix[i+1] = prefix[i] + nums[i] }
    
    left_bound = Array.new(n, -1)
    right_bound = Array.new(n, n)
    stack = []
    (0...n).each do |i|
        while !stack.empty? && nums[stack.last] > nums[i]
            right_bound[stack.pop] = i
        end
        stack << i
    end
    stack = []
    (n-1).downto(0) do |i|
        while !stack.empty? && nums[stack.last] > nums[i]
            left_bound[stack.pop] = i
        end
        stack << i
    end
    
    max_prod = 0
    (0...n).each do |i|
        l, r = left_bound[i], right_bound[i]
        total = prefix[r] - prefix[l+1]
        max_prod = [max_prod, nums[i] * total].max
    end
    max_prod % (10**9 + 7)
end
