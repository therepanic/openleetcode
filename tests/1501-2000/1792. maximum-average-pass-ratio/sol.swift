import Foundation

class Solution {
    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
        func gain(_ p: Double, _ t: Double) -> Double {
            return (p + 1) / (t + 1) - p / t
        }
        var pq = PriorityQueue<(Double, Int, Int)> { $0.0 > $1.0 }
        for c in classes {
            let p = Double(c[0]), t = Double(c[1])
            pq.enqueue((gain(p, t), Int(p), Int(t)))
        }
        for _ in 0..<extraStudents {
            let top = pq.dequeue()!
            var p = top.1, t = top.2
            p += 1; t += 1
            pq.enqueue((gain(Double(p), Double(t)), p, t))
        }
        var sum = 0.0
        while let item = pq.dequeue() {
            sum += Double(item.1) / Double(item.2)
        }
        return sum / Double(classes.count)
    }
}

struct PriorityQueue<Element> {
    private var heap: [Element] = []
    private let areInIncreasingOrder: (Element, Element) -> Bool

    init(areInIncreasingOrder: @escaping (Element, Element) -> Bool) {
        self.areInIncreasingOrder = areInIncreasingOrder
    }

    mutating func enqueue(_ element: Element) {
        heap.append(element)
        siftUp(heap.count - 1)
    }

    mutating func dequeue() -> Element? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeLast() }
        heap.swapAt(0, heap.count - 1)
        let result = heap.removeLast()
        siftDown(0)
        return result
    }

    private mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && !areInIncreasingOrder(heap[parent], heap[child]) {
            heap.swapAt(parent, child)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            if left < heap.count && !areInIncreasingOrder(heap[candidate], heap[left]) {
                candidate = left
            }
            if right < heap.count && !areInIncreasingOrder(heap[candidate], heap[right]) {
                candidate = right
            }
            if candidate == parent { return }
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
