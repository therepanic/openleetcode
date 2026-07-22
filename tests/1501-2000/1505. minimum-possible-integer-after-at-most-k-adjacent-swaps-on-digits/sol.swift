class Solution {
    func minInteger(_ num: String, _ k: Int) -> String {
        let n = num.count
        var dict = [Character: [Int]]()
        for (i, ch) in num.enumerated() {
            dict[ch, default: []].append(i)
        }
        
        var bit = [Int](repeating: 0, count: n + 1)
        func update(_ i: Int, _ val: Int) {
            var idx = i
            while idx < bit.count {
                bit[idx] += val
                idx += idx & -idx
            }
        }
        func query(_ i: Int) -> Int {
            var total = 0
            var idx = i
            while idx > 0 {
                total += bit[idx]
                idx -= idx & -idx
            }
            return total
        }
        
        for i in 1...n {
            update(i, 1)
        }
        
        var kk = k
        var res = ""
        for _ in 0..<n {
            for v in "0123456789" {
                if let arr = dict[v], !arr.isEmpty {
                    let idx = arr[0]
                    let cnt = query(idx)
                    if cnt <= kk {
                        dict[v]!.removeFirst()
                        kk -= cnt
                        res.append(v)
                        update(idx + 1, -1)
                        break
                    }
                }
            }
        }
        return res
    }
}
