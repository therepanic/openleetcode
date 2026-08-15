class Solution {
    func scoreOfStudents(_ s: String, _ answers: [Int]) -> Int {
        var memo = [String: Set<Int>]()
        
        func fn(_ lo: Int, _ hi: Int) -> Set<Int> {
            let key = "\(lo),\(hi)"
            if let cached = memo[key] { return cached }
            let chars = Array(s)
            if lo + 1 == hi {
                let val = Int(String(chars[lo]))!
                memo[key] = [val]
                return [val]
            }
            var result = Set<Int>()
            var mid = lo + 1
            while mid < hi {
                let left = fn(lo, mid)
                let right = fn(mid + 1, hi)
                for x in left {
                    for y in right {
                        if chars[mid] == "+" && x + y <= 1000 {
                            result.insert(x + y)
                        } else if chars[mid] == "*" && x * y <= 1000 {
                            result.insert(x * y)
                        }
                    }
                }
                mid += 2
            }
            memo[key] = result
            return result
        }
        
        // evaluate target with precedence
        var nums = [Int]()
        var ops = [Character]()
        let chars = Array(s)
        for i in 0..<chars.count {
            let c = chars[i]
            if c.isNumber {
                nums.append(Int(String(c))!)
            } else if c == "+" || c == "*" {
                while !ops.isEmpty && precedence(ops.last!) >= precedence(c) {
                    apply(&nums, &ops)
                }
                ops.append(c)
            }
        }
        while !ops.isEmpty { apply(&nums, &ops) }
        let target = nums.last!
        
        let cand = fn(0, s.count)
        var score = 0
        for x in answers {
            if x == target { score += 5 }
            else if cand.contains(x) { score += 2 }
        }
        return score
    }
    
    private func precedence(_ c: Character) -> Int {
        return c == "*" ? 2 : 1
    }
    
    private func apply(_ nums: inout [Int], _ ops: inout [Character]) {
        let b = nums.removeLast()
        let a = nums.removeLast()
        let op = ops.removeLast()
        nums.append(op == "+" ? a + b : a * b)
    }
}
