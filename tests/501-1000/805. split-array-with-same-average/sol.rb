# @param {Integer[]} nums
# @return {Boolean}
def split_array_same_average(nums)
    return false if nums.length < 2
    total = nums.sum
    n = nums.length
    nums = nums.map { |num| num * n - total }
    
    mp_a = {}
    mid = n >> 1
    arr = nums[0...mid]
    (1...(1 << arr.length)).each do |mask|
        s = 0
        cnt = 0
        arr.each_with_index do |val, i|
            if mask & (1 << i) != 0
                s += val
                cnt += 1
            end
        end
        mp_a[cnt] ||= Set.new
        mp_a[cnt].add(s)
    end
    
    mp_b = {}
    arr = nums[mid..-1]
    (1...(1 << arr.length)).each do |mask|
        s = 0
        cnt = 0
        arr.each_with_index do |val, i|
            if mask & (1 << i) != 0
                s += val
                cnt += 1
            end
        end
        mp_b[cnt] ||= Set.new
        mp_b[cnt].add(s)
    end
    
    mp_a.each do |cnt, set|
        if set.include?(0) && cnt != 0
            return true
        end
    end
    mp_b.each do |cnt, set|
        if set.include?(0) && cnt != 0
            return true
        end
    end
    
    mp_a.each do |cnt_a, set_a|
        mp_b.each do |cnt_b, set_b|
            total_cnt = cnt_a + cnt_b
            next if total_cnt == 0 || total_cnt == n
            set_a.each do |val|
                if set_b.include?(-val)
                    return true
                end
            end
        end
    end
    false
end
