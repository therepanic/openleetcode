# @param {Integer[][]} logs
# @param {Integer} k
# @return {Integer[]}
def finding_users_active_minutes(logs, k)
    mp = Hash.new { |h, key| h[key] = Set.new }
    logs.each do |user, minute|
        mp[user] << minute
    end
    ans = Array.new(k, 0)
    mp.each do |user, set|
        size = set.size
        if size <= k
            ans[size - 1] += 1
        end
    end
    ans
end
