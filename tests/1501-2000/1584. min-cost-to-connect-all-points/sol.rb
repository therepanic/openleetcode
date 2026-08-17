def min_cost_connect_points(points)
    n = points.length
    min_cost = 0
    visited = Array.new(n, false)
    pq = [[0, 0]]
    cache = {0 => 0}
    
    until pq.empty?
        cost, u = pq.shift
        next if visited[u]
        visited[u] = true
        min_cost += cost
        (0...n).each do |v|
            next if visited[v]
            dist = (points[u][0] - points[v][0]).abs + (points[u][1] - points[v][1]).abs
            if dist < (cache[v] || Float::INFINITY)
                cache[v] = dist
                # simple insert to maintain heap property
                idx = pq.bsearch_index { |x| x[0] >= dist } || pq.length
                pq.insert(idx, [dist, v])
            end
        end
    end
    min_cost
end
