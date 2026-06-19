class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let n1 = s.count, n2 = p.count
        var res = [Int]()
        if n1 < n2 { return res }

        var a = [Int](repeating: 0, count: 26)
        var b = [Int](repeating: 0, count: 26)
        let sArr = Array(s)
        let pArr = Array(p)

        for i in 0..<n2 {
            a[Int(pArr[i].asciiValue! - 97)] += 1
            b[Int(sArr[i].asciiValue! - 97)] += 1
        }

        if a == b { res.append(0) }

        for i in n2..<n1 {
            b[Int(sArr[i].asciiValue! - 97)] += 1
            b[Int(sArr[i - n2].asciiValue! - 97)] -= 1
            if a == b { res.append(i - n2 + 1) }
        }

        return res
    }
}
