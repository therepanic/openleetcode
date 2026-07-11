class Solution {
    func splitArraySameAverage(_ nums: [Int]) -> Bool {
        let n = nums.count
        if n < 2 { return false }
        let total = nums.reduce(0, +)
        let transformed = nums.map { $0 * n - total }
        
        let mid = n >> 1
        func generate(_ arr: [Int]) -> [Int: Set<Int>] {
            var mp = [Int: Set<Int>]()
            for mask in 1..<(1 << arr.count) {
                var sum = 0, cnt = 0
                for i in 0..<arr.count {
                    if mask & (1 << i) != 0 {
                        sum += arr[i]
                        cnt += 1
                    }
                }
                mp[cnt, default: Set<Int>()].insert(sum)
            }
            return mp
        }
        
        let mpA = generate(Array(transformed[0..<mid]))
        let mpB = generate(Array(transformed[mid..<n]))
        
        for (cnt, set) in mpA {
            if set.contains(0) && cnt != 0 { return true }
        }
        for (cnt, set) in mpB {
            if set.contains(0) && cnt != 0 { return true }
        }
        
        for (cntA, setA) in mpA {
            for (cntB, setB) in mpB {
                let totalCnt = cntA + cntB
                if totalCnt == 0 || totalCnt == n { continue }
                for val in setA {
                    if setB.contains(-val) { return true }
                }
            }
        }
        return false
    }
}
