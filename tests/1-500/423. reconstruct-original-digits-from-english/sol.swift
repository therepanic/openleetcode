class Solution {
    func originalDigits(_ s: String) -> String {
        var c = [Character: Int]()
        for ch in s {
            c[ch, default: 0] += 1
        }
        var d = [Int](repeating: 0, count: 10)
        d[0] = c["z"] ?? 0
        d[2] = c["w"] ?? 0
        d[4] = c["u"] ?? 0
        d[6] = c["x"] ?? 0
        d[8] = c["g"] ?? 0
        d[1] = (c["o"] ?? 0) - d[0] - d[2] - d[4]
        d[3] = (c["h"] ?? 0) - d[8]
        d[5] = (c["f"] ?? 0) - d[4]
        d[7] = (c["s"] ?? 0) - d[6]
        d[9] = (c["i"] ?? 0) - d[5] - d[6] - d[8]
        var result = ""
        for i in 0...9 {
            result += String(repeating: String(i), count: d[i])
        }
        return result
    }
}
