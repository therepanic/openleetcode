class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var lst: [Int] = []
        for i in left...right {
            let s = String(i)
            if s.contains("0") { continue }
            var b = 1
            for ch in s {
                let digit = Int(String(ch))!
                if i % digit != 0 {
                    b = 0
                    break
                }
            }
            if b == 1 { lst.append(i) }
        }
        return lst
    }
}
