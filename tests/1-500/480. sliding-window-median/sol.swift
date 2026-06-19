import Foundation

struct Heap {
    var data: [Int] = []
    let cmp: (Int, Int) -> Bool

    init(_ cmp: @escaping (Int, Int) -> Bool) {
        self.cmp = cmp
    }

    var isEmpty: Bool { data.isEmpty }
    var count: Int { data.count }
    var top: Int { data[0] }

    mutating func push(_ value: Int) {
        data.append(value)
        var i = data.count - 1
        while i > 0 {
            let p = (i - 1) / 2
            if !cmp(data[i], data[p]) { break }
            data.swapAt(i, p)
            i = p
        }
    }

    mutating func pop() -> Int {
        let root = data[0]
        let last = data.removeLast()
        if !data.isEmpty {
            data[0] = last
            var i = 0
            while true {
                var best = i
                let left = i * 2 + 1
                let right = left + 1
                if left < data.count && cmp(data[left], data[best]) { best = left }
                if right < data.count && cmp(data[right], data[best]) { best = right }
                if best == i { break }
                data.swapAt(i, best)
                i = best
            }
        }
        return root
    }
}

final class DualHeap {
    var small = Heap(>)
    var large = Heap(<)
    var delayed: [Int: Int] = [:]
    let k: Int
    var smallSize = 0
    var largeSize = 0

    init(_ k: Int) {
        self.k = k
    }

    private func decDelayed(_ num: Int) {
        if let count = delayed[num] {
            if count == 1 {
                delayed.removeValue(forKey: num)
            } else {
                delayed[num] = count - 1
            }
        }
    }

    func pruneSmall() {
        while !small.isEmpty {
            let num = small.top
            guard delayed[num] != nil else { break }
            decDelayed(num)
            _ = small.pop()
        }
    }

    func pruneLarge() {
        while !large.isEmpty {
            let num = large.top
            guard delayed[num] != nil else { break }
            decDelayed(num)
            _ = large.pop()
        }
    }

    func makeBalance() {
        if smallSize > largeSize + 1 {
            large.push(small.pop())
            smallSize -= 1
            largeSize += 1
            pruneSmall()
        } else if smallSize < largeSize {
            small.push(large.pop())
            smallSize += 1
            largeSize -= 1
            pruneLarge()
        }
    }

    func insert(_ num: Int) {
        if small.isEmpty || num <= small.top {
            small.push(num)
            smallSize += 1
        } else {
            large.push(num)
            largeSize += 1
        }
        makeBalance()
    }

    func erase(_ num: Int) {
        delayed[num, default: 0] += 1
        if num <= small.top {
            smallSize -= 1
            if num == small.top { pruneSmall() }
        } else {
            largeSize -= 1
            if !large.isEmpty && num == large.top { pruneLarge() }
        }
        makeBalance()
    }

    func median() -> Double {
        if k % 2 == 1 { return Double(small.top) }
        return (Double(small.top) + Double(large.top)) / 2.0
    }
}

class Solution {
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        let dh = DualHeap(k)
        for i in 0..<k { dh.insert(nums[i]) }
        var ans = [dh.median()]
        if nums.count > k {
            for i in k..<nums.count {
                dh.insert(nums[i])
                dh.erase(nums[i - k])
                ans.append(dh.median())
            }
        }
        return ans
    }
}
