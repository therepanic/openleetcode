class Solution {
    func minimumTimeRequired(_ jobs: [Int], _ k: Int) -> Int {
        let jobs = jobs.sorted(by: >)
        var left = jobs[0]
        var right = jobs.reduce(0, +)
        
        func canDistribute(_ maxWorkload: Int) -> Bool {
            var workers = Array(repeating: 0, count: k)
            
            func assignJob(_ jobIndex: Int) -> Bool {
                if jobIndex == jobs.count {
                    return true
                }
                for i in 0..<k {
                    if workers[i] + jobs[jobIndex] <= maxWorkload {
                        workers[i] += jobs[jobIndex]
                        if assignJob(jobIndex + 1) {
                            return true
                        }
                        workers[i] -= jobs[jobIndex]
                    }
                    if workers[i] == 0 {
                        break
                    }
                }
                return false
            }
            
            return assignJob(0)
        }
        
        while left < right {
            let mid = (left + right) / 2
            if canDistribute(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
