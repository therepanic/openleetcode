# @param {Integer[][]} events
# @param {Integer} k
# @return {Integer}
def max_value(events, k)
    events.sort_by! { |e| e[1] }
    n = events.length
    dp = Array.new(n + 1) { Array.new(k + 1, 0) }
    
    (1..n).each do |i|
        start_time = events[i - 1][0]
        value = events[i - 1][2]
        prev = find_last_non_overlapping(events, i - 1, start_time)
        (1..k).each do |j|
            dp[i][j] = [dp[i - 1][j], dp[prev + 1][j - 1] + value].max
        end
    end
    dp[n][k]
end

def find_last_non_overlapping(events, right, target_start)
    left = 0
    res = -1
    while left <= right
        mid = (left + right) / 2
        if events[mid][1] < target_start
            res = mid
            left = mid + 1
        else
            right = mid - 1
        end
    end
    res
end
