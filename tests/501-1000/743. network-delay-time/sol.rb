def network_delay_time(times, n, k)
  adj = Array.new(n + 1) { [] }
  times.each do |u, v, w|
    adj[u] << [v, w]
  end
  
  dist = Array.new(n + 1, Float::INFINITY)
  dist[k] = 0
  
  # Using Ruby's built-in array as a min-heap with manual sort
  pq = [[0, k]]
  
  until pq.empty?
    pq.sort_by! { |a| -a[0] }  # reverse for pop
    dis, node = pq.pop
    next if dis > dist[node]
    
    adj[node].each do |adj_node, wt|
      if dis + wt < dist[adj_node]
        dist[adj_node] = dis + wt
        pq.push([dist[adj_node], adj_node])
      end
    end
  end
  
  ans = 0
  (1..n).each do |i|
    return -1 if dist[i] == Float::INFINITY
    ans = [ans, dist[i]].max
  end
  ans
end
