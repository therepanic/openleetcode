class Solution {
    func getWinner(_ arr: [Int], _ k: Int) -> Int {
        var candidate = arr[0]
        var streak = 0
        for i in 1..<arr.count {
            if candidate > arr[i] {
                streak += 1
            } else {
                candidate = arr[i]
                streak = 1
            }
            if streak == k { return candidate }
        }
        return candidate
    }
}
