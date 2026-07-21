class Solution {
    func findBestValue(_ arr: [Int], _ target: Int) -> Int {
        func getMutatedSum(_ value: Int) -> Int {
            return arr.reduce(0) { $0 + min($1, value) }
        }
        
        var low = 0
        var high = arr.max()!
        var result = high
        var minDiff = Int.max
        
        while low <= high {
            let mid = low + (high - low) / 2
            let currSum = getMutatedSum(mid)
            let diff = abs(currSum - target)
            
            if diff < minDiff || (diff == minDiff && mid < result) {
                minDiff = diff
                result = mid
            }
            
            if currSum < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return result
    }
}
