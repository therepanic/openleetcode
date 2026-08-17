# @param {Integer[]} nums
# @param {Integer[][]} requests
# @return {Integer}
def max_sum_range_query(nums, requests)
    events = []
    mod = 10**9 + 7
    
    requests.each do |start, end_|
        events << [start, 1]
        events << [end_+1, -1]
    end
    
    events.sort!
    
    cnt = 0
    prev = -1
    weight = Hash.new(0)
    
    events.each do |pos, delta|
        if prev != -1 && cnt != 0
            weight[cnt] += pos - prev
        end
        prev = pos
        cnt += delta
    end
    
    weight_list = weight.sort_by { |k, v| -k }
    
    nums.sort! { |a, b| b <=> a }
    ans = 0
    i = 0
    
    weight_list.each do |wg, num|
        num.times do
            ans = (ans + nums[i] * wg) % mod
            i += 1
        end
    end
    
    ans
end
