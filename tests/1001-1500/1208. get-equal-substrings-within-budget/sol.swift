class Solution {
    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        let sArr = Array(s)
        let tArr = Array(t)
        var ans = 0, cost = 0, left = 0
        
        for right in 0..<sArr.count {
            cost += abs(Int(sArr[right].asciiValue!) - Int(tArr[right].asciiValue!))
            while cost > maxCost {
                cost -= abs(Int(sArr[left].asciiValue!) - Int(tArr[left].asciiValue!))
                left += 1
            }
            let size = right - left + 1
            if size > ans {
                ans = size
            }
        }
        return ans
    }
}
