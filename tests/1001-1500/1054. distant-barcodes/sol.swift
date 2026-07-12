class Solution {
    func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
        var h = [Int: Int]()
        for i in barcodes {
            h[i, default: 0] += 1
        }
        var heap = [[Int]]()
        for (k, v) in h {
            heap.append([-v, k])
        }
        heap.sort { $0[0] < $1[0] }
        var l = [Int]()
        while heap.count > 1 {
            var x = heap.removeFirst()
            var y = heap.removeFirst()
            l.append(x[1])
            l.append(y[1])
            x[0] += 1
            y[0] += 1
            if x[0] != 0 {
                heap.append(x)
                heap.sort { $0[0] < $1[0] }
            }
            if y[0] != 0 {
                heap.append(y)
                heap.sort { $0[0] < $1[0] }
            }
        }
        if !heap.isEmpty {
            l.append(heap[0][1])
        }
        return l
    }
}
