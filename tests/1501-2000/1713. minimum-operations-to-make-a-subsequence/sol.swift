class Solution {
    func minOperations(_ target: [Int], _ arr: [Int]) -> Int {
        var targetIndexMap: [Int: Int] = [:]
        for (i, num) in target.enumerated() {
            targetIndexMap[num] = i
        }
        
        var transformedArr: [Int] = []
        for num in arr {
            if let idx = targetIndexMap[num] {
                transformedArr.append(idx)
            }
        }
        
        var lis: [Int] = []
        for index in transformedArr {
            var low = 0
            var high = lis.count
            while low < high {
                let mid = (low + high) / 2
                if lis[mid] < index { low = mid + 1 } else { high = mid }
            }
            let pos = low
            if pos == lis.count {
                lis.append(index)
            } else {
                lis[pos] = index
            }
        }
        
        return target.count - lis.count
    }
}
