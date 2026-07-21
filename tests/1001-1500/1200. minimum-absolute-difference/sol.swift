class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        var arr = arr.sorted()
        var minDiff = Int.max
        for i in 1..<arr.count {
            minDiff = min(minDiff, arr[i] - arr[i - 1])
        }
        var result = [[Int]]()
        for i in 1..<arr.count {
            if arr[i] - arr[i - 1] == minDiff {
                result.append([arr[i - 1], arr[i]])
            }
        }
        return result
    }
}
