class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let sorted = people.sorted { $0[0] != $1[0] ? $0[0] > $1[0] : $0[1] < $1[1] }
        var q = [[Int]]()
        for p in sorted {
            q.insert(p, at: p[1])
        }
        return q
    }
}
