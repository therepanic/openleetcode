class Solution {
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ minutes: Int) -> Int {
        let n = customers.count
        var totalSatisfied = 0
        var currentWindowGain = 0
        
        for i in 0..<n {
            if grumpy[i] == 0 {
                totalSatisfied += customers[i]
            } else if i < minutes {
                currentWindowGain += customers[i]
            }
        }
        
        var maxWindowGain = currentWindowGain
        
        for i in minutes..<n {
            if grumpy[i] == 1 {
                currentWindowGain += customers[i]
            }
            if grumpy[i - minutes] == 1 {
                currentWindowGain -= customers[i - minutes]
            }
            if currentWindowGain > maxWindowGain {
                maxWindowGain = currentWindowGain
            }
        }
        
        return totalSatisfied + maxWindowGain
    }
}
