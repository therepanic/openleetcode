class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        let events = events.sorted { $0[0] < $1[0] }
        var minHeap = [Int]()
        var day = 0
        var i = 0
        let n = events.count
        var result = 0
        
        while !minHeap.isEmpty || i < n {
            if minHeap.isEmpty {
                day = events[i][0]
            }
            while i < n && events[i][0] <= day {
                minHeap.append(events[i][1])
                minHeap.sort(by: >)
                i += 1
            }
            minHeap.removeLast()
            result += 1
            day += 1
            while !minHeap.isEmpty && minHeap.last! < day {
                minHeap.removeLast()
            }
        }
        return result
    }
}
