class Solution {
    func sumZero(_ n: Int) -> [Int] {
        return (0..<n).map { $0 * 2 - n + 1 }
    }
}
