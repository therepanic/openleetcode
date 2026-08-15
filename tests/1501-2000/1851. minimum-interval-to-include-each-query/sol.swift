import Foundation

class Solution {
    func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        var minHeap = [(Int, Int)]()
        var res = [Int: Int]()
        var i = 0
        let sortedQueries = queries.sorted()
        for q in sortedQueries {
            while i < sortedIntervals.count && sortedIntervals[i][0] <= q {
                let l = sortedIntervals[i][0]
                let r = sortedIntervals[i][1]
                minHeap.append((r - l + 1, r))
                minHeap.sort { $0.0 < $1.0 }
                i += 1
            }
            while !minHeap.isEmpty && minHeap[0].1 < q {
                minHeap.removeFirst()
            }
            res[q] = minHeap.isEmpty ? -1 : minHeap[0].0
        }
        return queries.map { res[$0] ?? -1 }
    }
}
