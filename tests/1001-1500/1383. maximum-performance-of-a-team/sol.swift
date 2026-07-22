class Solution {
    func maxPerformance(_ n: Int, _ speed: [Int], _ efficiency: [Int], _ k: Int) -> Int {
        let MOD = 1000000007
        var engineers = zip(efficiency, speed).map { ($0, $1) }
        engineers.sort { $0.0 > $1.0 }
        
        var pq = MinHeap<Int>()
        var curSum = 0
        var ans = 0
        
        for (e, s) in engineers {
            while pq.count > k - 1 {
                curSum -= pq.remove()
            }
            pq.insert(s)
            curSum += s
            ans = max(ans, curSum * e)
        }
        
        return ans % MOD
    }
}

struct MinHeap<T: Comparable> {
    private var heap: [T] = []
    
    var count: Int { heap.count }
    
    mutating func insert(_ value: T) {
        heap.append(value)
        siftUp(heap.count - 1)
    }
    
    mutating func remove() -> T {
        let result = heap[0]
        heap[0] = heap[heap.count - 1]
        heap.removeLast()
        if !heap.isEmpty {
            siftDown(0)
        }
        return result
    }
    
    private mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var smallest = parent
            if left < heap.count && heap[left] < heap[smallest] {
                smallest = left
            }
            if right < heap.count && heap[right] < heap[smallest] {
                smallest = right
            }
            if smallest == parent { break }
            heap.swapAt(parent, smallest)
            parent = smallest
        }
    }
}
