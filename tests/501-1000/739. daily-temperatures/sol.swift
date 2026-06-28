class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var ans = [Int](repeating: 0, count: n)
        var stack = [Int]()

        for i in 0..<n {
            while let last = stack.last, temperatures[i] > temperatures[last] {
                let prev = stack.removeLast()
                ans[prev] = i - prev
            }
            stack.append(i)
        }

        return ans
    }
}
