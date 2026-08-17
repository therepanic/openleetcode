def count_subgraphs_for_each_diameter(n, edges)
    graph = Array.new(n) { [] }
    edges.each do |u, v|
        u -= 1
        v -= 1
        graph[u] << v
        graph[v] << u
    end
    answer = Array.new(n - 1, 0)
    (1...(1 << n)).each do |mask|
        next if mask & (mask - 1) == 0
        b = mask & -mask
        s = (b.bit_length - 1)
        seen = Array.new(n, false)
        seen[s] = true
        cnt = 1
        q = [s]
        until q.empty?
            u = q.shift
            graph[u].each do |v|
                if (mask >> v) & 1 == 1 && !seen[v]
                    seen[v] = true
                    cnt += 1
                    q << v
                end
            end
        end
        next if cnt != mask.to_s(2).count('1')
        bfs = ->(start) {
            d = Array.new(n, -1)
            d[start] = 0
            q = [start]
            last = start
            until q.empty?
                u = q.shift
                last = u
                graph[u].each do |v|
                    if (mask >> v) & 1 == 1 && d[v] == -1
                        d[v] = d[u] + 1
                        q << v
                    end
                end
            end
            [last, d[last]]
        }
        a, _ = bfs.call(s)
        _, diam = bfs.call(a)
        answer[diam - 1] += 1 if diam >= 1
    end
    answer
end
