class Solution {
    func minSwaps(_ s: String) -> Int {
        let count0 = s.filter { $0 == "0" }.count
        let count1 = s.filter { $0 == "1" }.count
        
        if abs(count0 - count1) > 1 { return -1 }
        
        let chars = Array(s)
        var mismatch0 = 0
        var mismatch1 = 0
        
        for i in 0..<chars.count {
            let expected0 = i % 2 == 0 ? "0" : "1"
            let expected1 = i % 2 == 0 ? "1" : "0"
            if String(chars[i]) != expected0 { mismatch0 += 1 }
            if String(chars[i]) != expected1 { mismatch1 += 1 }
        }
        
        if count0 == count1 { return min(mismatch0 / 2, mismatch1 / 2) }
        if count0 > count1 { return mismatch0 / 2 }
        return mismatch1 / 2
    }
}
