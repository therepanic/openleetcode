def min_cost(max_time, edges, passing_fees)
    n = passing_fees.size
    graph = Array.new(n) { [] }
    edges.each do |u, v, t|
        graph[u] << [v, t]
        graph[v] << [u, t]
    end
    times = Array.new(n, max_time + 1)
    costs = Array.new(n, Float::INFINITY)
    times[0] = 0
    costs[0] = passing_fees[0]
    pq = [[passing_fees[0], 0, 0]]
    until pq.empty?
        cost, time, city = pq.shift
        if city == n - 1
            return cost
        end
        graph[city].each do |nxt, t|
            nt = time + t
            next if nt > max_time
            nc = cost + passing_fees[nxt]
            if nc < costs[nxt] or nt < times[nxt]
                costs[nxt] = nc
                times[nxt] = nt
                pq << [nc, nt, nxt]
                pq.sort_by! { |arr| [arr[0], arr[1]] }
            end
        end
    end
    -1
end
