class Solution {
    func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
        let n = profits.count
        var projects = (0..<n).map { (capital[$0], profits[$0]) }
        projects.sort { $0.0 < $1.0 }
        var maxHeap = MaxHeap()
        var i = 0
        var w = w
        for _ in 0..<k {
            while i < n && projects[i].0 <= w {
                maxHeap.push(projects[i].1)
                i += 1
            }
            if maxHeap.isEmpty { break }
            w += maxHeap.pop()
        }
        return w
    }
}

struct MaxHeap {
    private var data: [Int] = []

    var isEmpty: Bool { data.isEmpty }

    mutating func push(_ value: Int) {
        data.append(value)
        var i = data.count - 1
        while i > 0 {
            let p = (i - 1) / 2
            if data[p] >= data[i] { break }
            data.swapAt(p, i)
            i = p
        }
    }

    mutating func pop() -> Int {
        let result = data[0]
        let last = data.removeLast()
        if !data.isEmpty {
            data[0] = last
            var i = 0
            while true {
                let left = i * 2 + 1
                let right = left + 1
                var best = i
                if left < data.count && data[left] > data[best] { best = left }
                if right < data.count && data[right] > data[best] { best = right }
                if best == i { break }
                data.swapAt(i, best)
                i = best
            }
        }
        return result
    }
}
