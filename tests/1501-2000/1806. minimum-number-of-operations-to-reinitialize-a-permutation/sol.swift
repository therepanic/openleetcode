class Solution {
    func reinitializePermutation(_ n: Int) -> Int {
        var original = Array(0..<n)
        var permut = original
        var arr = Array(repeating: 0, count: n)
        var count = 0
        while true {
            for i in 0..<n {
                if i % 2 == 0 {
                    arr[i] = permut[i / 2]
                } else {
                    arr[i] = permut[n / 2 + (i - 1) / 2]
                }
            }
            permut = arr
            count += 1
            if permut == original {
                break
            }
        }
        return count
    }
}
