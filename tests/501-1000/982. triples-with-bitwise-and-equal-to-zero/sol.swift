class Solution {
    func countTriplets(_ nums: [Int]) -> Int {
        var most = 0
        for num in nums {
            if num > most { most = num }
        }
        if most == 0 { return nums.count * nums.count * nums.count }

        var bits = 0
        var tmp = most
        while tmp > 0 {
            bits += 1
            tmp >>= 1
        }
        let N = 1 << bits

        var c = [Int](repeating: 0, count: N)
        for num in nums {
            c[num] += 1
        }

        var h = 1
        while h < N {
            var s = 0
            while s < N {
                for i in s..<s+h {
                    c[i] += c[i + h]
                }
                s += h << 1
            }
            h <<= 1
        }

        for i in 0..<N {
            c[i] = c[i] * c[i] * c[i]
        }

        h = 1
        while h < N {
            var s = 0
            while s < N {
                for i in s..<s+h {
                    c[i] -= c[i + h]
                }
                s += h << 1
            }
            h <<= 1
        }

        return c[0]
    }
}
