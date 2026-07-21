class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        let n = arr.count
        var prefix = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            prefix[i + 1] = prefix[i] ^ arr[i]
        }
        return queries.map { prefix[$0[1] + 1] ^ prefix[$0[0]] }
    }
}
