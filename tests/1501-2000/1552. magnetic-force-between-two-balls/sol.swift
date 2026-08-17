class Solution {
    func maxDistance(_ position: [Int], _ m: Int) -> Int {
        var sorted = position.sorted()
        var right = sorted[sorted.count - 1] - sorted[0]
        var left = 1
        
        while left <= right {
            let mid = (left + right) / 2
            var myBalls = 1
            var previous = sorted[0]
            
            for i in 1..<sorted.count {
                if sorted[i] - previous >= mid {
                    myBalls += 1
                    previous = sorted[i]
                }
            }
            
            if myBalls >= m {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return right
    }
}
