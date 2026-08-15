class Solution {
    func closestToTarget(_ arr: [Int], _ target: Int) -> Int {
        var answer = Int.max
        var previous: [Int] = []
        for value in arr {
            var current = [value]
            for old in previous {
                let candidate = old & value
                if current.last != candidate { current.append(candidate) }
            }
            for candidate in current { answer = min(answer, abs(candidate - target)) }
            previous = current
        }
        return answer
    }
}
