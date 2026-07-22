class Solution {
    func numTeams(_ rating: [Int]) -> Int {
        var total = 0
        let n = rating.count
        for j in 1..<n - 1 {
            var leftLess = 0
            var leftGreater = 0
            for i in 0..<j {
                if rating[i] < rating[j] {
                    leftLess += 1
                } else if rating[i] > rating[j] {
                    leftGreater += 1
                }
            }
            
            var rightLess = 0
            var rightGreater = 0
            for k in j + 1..<n {
                if rating[k] < rating[j] {
                    rightLess += 1
                } else if rating[k] > rating[j] {
                    rightGreater += 1
                }
            }
            
            total += leftLess * rightGreater + leftGreater * rightLess
        }
        return total
    }
}
