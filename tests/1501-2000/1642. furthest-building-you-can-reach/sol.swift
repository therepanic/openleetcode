class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var bricksLeft = bricks
        var heap = [Int]()
        let n = heights.count
        for i in 1..<n {
            let climb = heights[i] - heights[i-1]
            if climb <= 0 { continue }
            heap.append(climb)
            var child = heap.count - 1
            while child > 0 {
                let parent = (child - 1) / 2
                if heap[parent] <= heap[child] { break }
                heap.swapAt(parent, child)
                child = parent
            }
            if heap.count > ladders {
                let diff = heap[0]
                let last = heap.removeLast()
                if !heap.isEmpty { heap[0] = last }
                var parent = 0
                while true {
                    child = parent * 2 + 1
                    if child >= heap.count { break }
                    if child + 1 < heap.count && heap[child + 1] < heap[child] { child += 1 }
                    if heap[parent] <= heap[child] { break }
                    heap.swapAt(parent, child)
                    parent = child
                }
                if bricksLeft >= diff {
                    bricksLeft -= diff
                } else {
                    return i-1
                }
            }
        }
        return n-1
    }
}
