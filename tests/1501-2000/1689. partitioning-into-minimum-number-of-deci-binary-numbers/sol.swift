class Solution {
    func minPartitions(_ n: String) -> Int {
        return n.compactMap { Int(String($0)) }.max() ?? 0
    }
}
