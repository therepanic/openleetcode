class Solution {
    func minimumSwap(_ s1: String, _ s2: String) -> Int {
        let n = s1.count
        var s1X = 0
        var s1Y = 0
        let arr1 = Array(s1)
        let arr2 = Array(s2)
        for i in 0..<n {
            if arr1[i] == arr2[i] { continue }
            if arr1[i] == "x" {
                s1X += 1
            } else {
                s1Y += 1
            }
        }

        if s1X % 2 != s1Y % 2 { return -1 }

        let swaps = s1X / 2 + s1Y / 2
        return s1X % 2 == 0 ? swaps : swaps + 2
    }
}
