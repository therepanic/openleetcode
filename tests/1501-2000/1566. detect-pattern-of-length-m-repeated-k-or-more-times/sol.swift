class Solution {
    func containsPattern(_ arr: [Int], _ m: Int, _ k: Int) -> Bool {
        if m * k > arr.count { return false }
        for i in 0...(arr.count - m * k) {
            var match = true
            for j in 0..<(m * (k - 1)) {
                if arr[i + j] != arr[i + j + m] {
                    match = false
                    break
                }
            }
            if match { return true }
        }
        return false
    }
}
