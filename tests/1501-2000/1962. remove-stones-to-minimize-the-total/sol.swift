class Solution {
    func minStoneSum(_ piles: [Int], _ k: Int) -> Int {
        var heap = piles.sorted(by: >)
        for _ in 0..<k {
            let x = heap[0]
            let reduced = (x + 1) / 2
            heap[0] = reduced
            var i = 0
            while true {
                let left = i * 2 + 1
                if left >= heap.count { break }
                let right = left + 1
                let child = right < heap.count && heap[right] > heap[left] ? right : left
                if heap[i] >= heap[child] { break }
                heap.swapAt(i, child)
                i = child
            }
        }
        return heap.reduce(0, +)
    }
}
