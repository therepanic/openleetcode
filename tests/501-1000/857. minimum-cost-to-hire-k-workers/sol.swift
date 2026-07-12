class Solution {
    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
        let n = quality.count
        var workers: [(Double, Int)] = []
        for i in 0..<n {
            workers.append((Double(wage[i]) / Double(quality[i]), quality[i]))
        }
        workers.sort { $0.0 < $1.0 }
        
        var minCost = Double.greatestFiniteMagnitude
        var currentQualitySum = 0
        var maxHeap: [Int] = []
        
        for (ratio, q) in workers {
            currentQualitySum += q
            maxHeap.append(q)
            maxHeap.sort(by: >)
            
            if maxHeap.count > k {
                currentQualitySum -= maxHeap.removeFirst()
            }
            
            if maxHeap.count == k {
                minCost = min(minCost, ratio * Double(currentQualitySum))
            }
        }
        
        return minCost
    }
}
