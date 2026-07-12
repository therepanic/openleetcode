# @param {Integer[]} ages
# @return {Integer}
def num_friend_requests(ages)
    cnt = Array.new(121, 0)
    ages.each do |age|
        cnt[age] += 1
    end
    pre = Array.new(122, 0)
    (0...121).each do |i|
        pre[i + 1] = pre[i] + cnt[i]
    end
    ans = 0
    (15...121).each do |age|
        if cnt[age] > 0
            lower = (age * 0.5 + 7).to_i
            total = pre[age + 1] - pre[lower + 1]
            ans += cnt[age] * (total - 1)
        end
    end
    ans
end
