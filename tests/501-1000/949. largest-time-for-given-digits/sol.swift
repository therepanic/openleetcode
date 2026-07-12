class Solution {
    func largestTimeFromDigits(_ arr: [Int]) -> String {
        var arr = arr
        var permList: [[Int]] = []
        permute(&arr, 0, &permList)
        
        var bestTime = -1
        var bestIdx = -1
        
        for i in 0..<permList.count {
            let perm = permList[i]
            let hours = perm[0] * 10 + perm[1]
            let minutes = perm[2] * 10 + perm[3]
            
            if hours < 24 && minutes < 60 {
                let currTime = hours * 60 + minutes
                if currTime > bestTime {
                    bestTime = currTime
                    bestIdx = i
                }
            }
        }
        
        if bestIdx == -1 { return "" }
        
        let res = permList[bestIdx]
        return "\(res[0])\(res[1]):\(res[2])\(res[3])"
    }
    
    private func permute(_ arr: inout [Int], _ start: Int, _ result: inout [[Int]]) {
        if start == arr.count {
            result.append(arr)
            return
        }
        for i in start..<arr.count {
            arr.swapAt(start, i)
            permute(&arr, start + 1, &result)
            arr.swapAt(start, i)
        }
    }
}
