class Solution {
    func eatenApples(_ apples: [Int], _ days: [Int]) -> Int {
        var heap = [(Int, Int)]()
        let n = apples.count
        var res = 0
        var day = 0
        while !heap.isEmpty || day < n {
            if day < n && apples[day] > 0 {
                heap.append((day + days[day], apples[day]))
                heap.sort { $0.0 < $1.0 }
            }
            while !heap.isEmpty && heap[0].0 <= day {
                heap.removeFirst()
            }
            if !heap.isEmpty {
                let (expire, count) = heap.removeFirst()
                res += 1
                if count - 1 > 0 {
                    heap.append((expire, count - 1))
                    heap.sort { $0.0 < $1.0 }
                }
            }
            day += 1
        }
        return res
    }
}
