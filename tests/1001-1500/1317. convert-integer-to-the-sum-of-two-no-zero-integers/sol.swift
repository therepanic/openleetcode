class Solution {
    func getNoZeroIntegers(_ n: Int) -> [Int] {
        for i in 1..<n {
            if !String(i).contains("0") && !String(n - i).contains("0") {
                return [i, n - i]
            }
        }
        return []
    }
}
