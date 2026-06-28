class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var count = [Character: Int]()
        for t in tasks {
            count[t, default: 0] += 1
        }
        let f_max = count.values.max()!
        let max_count = count.values.filter { $0 == f_max }.count
        return max(tasks.count, (f_max - 1) * (n + 1) + max_count)
    }
}
