class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var bucket = [Int](repeating: 0, count: 20001)
        for x in nums {
            bucket[x + 10000] += 1
        }
        var res = 0
        var flag = true
        for i in 0..<20001 {
            while bucket[i] > 0 {
                if flag {
                    res += i - 10000
                }
                flag.toggle()
                bucket[i] -= 1
            }
        }
        return res
    }
}
