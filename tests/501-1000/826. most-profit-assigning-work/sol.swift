class Solution {
    func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
        let jobs = zip(difficulty, profit).sorted { $0.0 < $1.0 }
        let worker = worker.sorted()
        var ans = 0
        var best = 0
        var i = 0
        for ability in worker {
            while i < jobs.count && jobs[i].0 <= ability {
                best = max(best, jobs[i].1)
                i += 1
            }
            ans += best
        }
        return ans
    }
}
