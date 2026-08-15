def box_delivering(boxes, ports_count, max_boxes, max_weight)
    n = boxes.length
    ports = [0]*(n+1)
    weights = [0]*(n+1)
    boxes.each_with_index do |(p,w), i|
        ports[i+1] = p
        weights[i+1] = w
    end
    prefix_weights = [0]*(n+1)
    (1..n).each do |i|
        prefix_weights[i] = prefix_weights[i-1] + weights[i]
    end
    ports_cnt = [0]*(n+2)
    (2..n).each do |i|
        ports_cnt[i] = ports_cnt[i-1] + (ports[i] != ports[i-1] ? 1 : 0)
    end
    ports_cnt[n+1] = ports_cnt[n]
    dp = [0]*(n+1)
    queue = [0]
    left = 0
    (1..n).each do |i|
        while i - left > max_boxes || prefix_weights[i] - prefix_weights[left] > max_weight
            queue.shift if !queue.empty? && queue[0] == left
            left += 1
        end
        dp[i] = 2 + ports_cnt[i] + (dp[queue[0]]-ports_cnt[queue[0]+1])
        idx = dp[i]-ports_cnt[i+1]
        while !queue.empty? && (dp[queue[-1]]-ports_cnt[queue[-1]+1]) >= idx
            queue.pop
        end
        queue.push(i)
    end
    dp[n]
end
