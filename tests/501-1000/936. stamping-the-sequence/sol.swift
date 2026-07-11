class Solution {
    func movesToStamp(_ stamp: String, _ target: String) -> [Int] {
        let m = stamp.count
        let n = target.count
        var stampArr = Array(stamp)
        var targetArr = Array(target)
        
        func canStamp(_ i: Int) -> Bool {
            for j in 0..<m {
                if targetArr[i + j] != Character("?") && targetArr[i + j] != stampArr[j] {
                    return false
                }
            }
            return true
        }
        
        func applyStamp(_ i: Int) {
            for j in 0..<m {
                targetArr[i + j] = Character("?")
            }
        }
        
        var stamped = [Bool](repeating: false, count: n)
        var result = [Int]()
        var queue = [Int]()
        
        for i in 0...(n - m) {
            if canStamp(i) {
                applyStamp(i)
                queue.append(i)
                result.append(i)
                stamped[i] = true
            }
        }
        
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let start = max(0, pos - m + 1)
            let end = min(n - m, pos + m)
            for i in start...end {
                if canStamp(i) {
                    if !stamped[i] {
                        applyStamp(i)
                        queue.append(i)
                        result.append(i)
                        stamped[i] = true
                    }
                }
            }
        }
        
        if targetArr.allSatisfy({ $0 == Character("?") }) {
            return result.reversed()
        }
        return []
    }
}
