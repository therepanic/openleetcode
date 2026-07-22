import Collections

class Solution {
    func isPossible(_ target: [Int]) -> Bool {
        var heap = Heap<Int>(target)
        var total = target.reduce(0, +)
        while true {
            guard let largest = heap.popMax() else { break }
            let rest = total - largest
            if largest == 1 || rest == 1 {
                return true
            }
            if rest == 0 || rest >= largest {
                return false
            }
            let previous = largest % rest
            if previous == 0 {
                return false
            }
            total = rest + previous
            heap.insert(previous)
        }
        return false
    }
}
