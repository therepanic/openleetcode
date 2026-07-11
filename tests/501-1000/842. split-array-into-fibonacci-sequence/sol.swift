class Solution {
    func splitIntoFibonacci(_ num: String) -> [Int] {
        let chars = Array(num)
        let n = chars.count
        
        func invalid(_ x: String) -> Bool {
            if x.first == "0" && x.count > 1 { return true }
            if x.count > 10 { return true }
            return (Int(x) ?? Int.max) >= (1 << 31)
        }
        
        func check(_ a0: String, _ a1: String, _ numStr: String) -> [Int] {
            var i = 0
            let numChars = Array(numStr)
            var ret = [Int(a0)!, Int(a1)!]
            var curA0 = a0
            var curA1 = a1
            while i < numChars.count {
                let a0Val = Int(curA0)!
                let a1Val = Int(curA1)!
                let res = String(a0Val + a1Val)
                var j = 0
                let resChars = Array(res)
                while i < numChars.count && j < resChars.count && resChars[j] == numChars[i] {
                    j += 1
                    i += 1
                }
                if j < resChars.count || invalid(res) {
                    return []
                }
                curA0 = curA1
                curA1 = res
                ret.append(Int(res)!)
            }
            return ret
        }
        
        for j in 1..<n-1 {
            for i in 0..<j {
                let a0 = String(chars[0...i])
                let a1 = String(chars[i+1...j])
                if invalid(a0) || invalid(a1) { continue }
                let remaining = String(chars[j+1..<n])
                let ret = check(a0, a1, remaining)
                if !ret.isEmpty { return ret }
            }
        }
        return []
    }
}
