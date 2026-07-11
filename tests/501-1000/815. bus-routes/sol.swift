class Solution {
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        if source == target { return 0 }
        var adj = [Int: Set<Int>]()
        for (bus, locations) in routes.enumerated() {
            for location in locations {
                adj[location, default: []].insert(bus)
            }
        }
        var queue = Array(adj[target] ?? [])
        var cost = 0
        var visited = Set<Int>()
        while !queue.isEmpty {
            cost += 1
            let size = queue.count
            for _ in 0..<size {
                let node = queue.removeFirst()
                visited.insert(node)
                if routes[node].contains(source) {
                    return cost
                }
                for location in routes[node] {
                    for bus in adj[location] ?? [] {
                        if !visited.contains(bus) {
                            queue.append(bus)
                        }
                    }
                }
            }
        }
        return -1
    }
}
