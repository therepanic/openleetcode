class Solution {
    func beautySum(_ s: String) -> Int {
        let n = s.count
        var sumOfBeauty = 0
        let chars = Array(s)
        for i in 0..<n {
            var freq = [Int](repeating: 0, count: 26)
            for j in i..<n {
                freq[Int(chars[j].asciiValue! - 97)] += 1
                var maxi = -1
                var mini = Int.max
                for diff in freq {
                    if diff > 0 {
                        maxi = max(maxi, diff)
                        mini = min(mini, diff)
                    }
                }
                sumOfBeauty += maxi - mini
            }
        }
        return sumOfBeauty
    }
}
