class Solution {
    func findTheLongestSubstring(_ s: String) -> Int {
        var mapy = [Int](repeating: -2, count: 32)
        mapy[0] = -1

        var res = 0
        var mask = 0
        let chars = Array(s)

        for i in 0..<chars.count {
            let c = chars[i]
            switch c {
            case "a":
                mask ^= 1
            case "e":
                mask ^= 2
            case "i":
                mask ^= 4
            case "o":
                mask ^= 8
            case "u":
                mask ^= 16
            default:
                break
            }

            let prev = mapy[mask]
            if prev == -2 {
                mapy[mask] = i
            } else {
                res = max(res, i - prev)
            }
        }

        return res
    }
}
