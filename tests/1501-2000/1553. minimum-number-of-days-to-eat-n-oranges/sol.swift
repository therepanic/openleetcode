class Solution {
    func minDays(_ n: Int) -> Int {
        var ans = 0
        var queue = [n]
        var seen = Set<Int>()
        while !queue.isEmpty {
            var newq = [Int]()
            for x in queue {
                if x == 0 { return ans }
                seen.insert(x)
                if !seen.contains(x-1) { newq.append(x-1) }
                if x % 2 == 0 && !seen.contains(x/2) { newq.append(x/2) }
                if x % 3 == 0 && !seen.contains(x/3) { newq.append(x/3) }
            }
            ans += 1
            queue = newq
        }
        return ans
    }
}
