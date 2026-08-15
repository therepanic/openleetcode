class Solution {
    func minFlips(_ s: String) -> Int {
        let n = s.count
        let t = s + s
        var ans = n
        var mis0 = 0
        let chars = Array(t)

        for i in 0..<(2 * n) {
            let expected0 = i % 2 == 0 ? "0" : "1"
            if String(chars[i]) != expected0 {
                mis0 += 1
            }

            if i >= n {
                let left = i - n
                let expLeft = left % 2 == 0 ? "0" : "1"
                if String(chars[left]) != expLeft {
                    mis0 -= 1
                }
            }

            if i >= n - 1 {
                let mis1 = n - mis0
                ans = min(ans, min(mis0, mis1))
            }
        }

        return ans
    }
}
