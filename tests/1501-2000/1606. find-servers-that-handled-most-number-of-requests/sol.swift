class Solution {
    func busiestServers(_ k: Int, _ arrival: [Int], _ load: [Int]) -> [Int] {
        var available = Set<Int>(0..<k)
        var busy = [(Int, Int)]() // (endTime, server)
        var res = Array(repeating: 0, count: k)
        for (i, a) in arrival.enumerated() {
            while !busy.isEmpty && busy.min(by: { $0.0 < $1.0 })!.0 <= a {
                let (_, x) = busy.min(by: { $0.0 < $1.0 })!
                busy.removeAll { $0.1 == x }
                available.insert(i + ((x - i) % k + k) % k)
            }
            if !available.isEmpty {
                let encoded = available.min()!
                let j = encoded % k
                available.remove(encoded)
                busy.append((a + load[i], j))
                res[j] += 1
            }
        }
        let max = res.max()!
        return (0..<k).filter { res[$0] == max }
    }
}
