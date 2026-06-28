class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var matrix = [[(Int, Int)]](repeating: [], count: n)
        for flight in flights {
            let u = flight[0], v = flight[1], w = flight[2]
            matrix[u].append((v, w))
        }

        var distance = [Int](repeating: Int.max, count: n)
        distance[src] = 0

        var queue = [(Int, Int)]()
        queue.append((src, 0))
        var steps = 0

        while !queue.isEmpty {
            let level = queue.count
            if steps == k + 1 {
                break
            }
            steps += 1

            for _ in 0..<level {
                let (node, dist) = queue.removeFirst()
                for (v, w) in matrix[node] {
                    if w + dist < distance[v] {
                        distance[v] = w + dist
                        queue.append((v, dist + w))
                    }
                }
            }
        }

        return distance[dst] == Int.max ? -1 : distance[dst]
    }
}
