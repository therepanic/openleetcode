class Solution {
    func minimumDeviation(_ nums: [Int]) -> Int {
        if nums.isEmpty { return Int.max }
        
        var maxHeap: [Int] = []
        func push(_ value: Int) { maxHeap.append(value); var i = maxHeap.count - 1; while i > 0 { let p = (i - 1) / 2; if maxHeap[p] >= maxHeap[i] { break }; maxHeap.swapAt(p, i); i = p } }
        var minVal = Int.max
        
        for num in nums {
            if num % 2 == 0 {
                push(num)
                minVal = min(num, minVal)
            } else {
                push(num * 2)
                minVal = min(num * 2, minVal)
            }
        }
        
        var res = Int.max
        while maxHeap[0] % 2 == 0 {
            let maxVal = maxHeap[0]; maxHeap[0] = maxHeap[maxHeap.count - 1]; maxHeap.removeLast(); var i = 0; while true { let l = i * 2 + 1; if l >= maxHeap.count { break }; let r = l + 1; var j = l; if r < maxHeap.count && maxHeap[r] > maxHeap[l] { j = r }; if maxHeap[i] >= maxHeap[j] { break }; maxHeap.swapAt(i, j); i = j }
            res = min(res, maxVal - minVal)
            let newNum = maxVal / 2
            push(newNum)
            minVal = min(newNum, minVal)
        }
        
        res = min(maxHeap[0] - minVal, res)
        return res
    }
}
