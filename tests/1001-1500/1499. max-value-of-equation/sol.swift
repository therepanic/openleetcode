class Solution {
    func findMaxValueOfEquation(_ points: [[Int]], _ k: Int) -> Int {
        var window = [(Int, Int)]()
        var answer = Int.min
        for point in points {
            let x = point[0]
            let y = point[1]
            while !window.isEmpty && x - window[0].1 > k {
                window.removeFirst()
            }
            if !window.isEmpty {
                answer = max(answer, x + y + window[0].0)
            }
            let value = y - x
            while !window.isEmpty && window.last!.0 <= value {
                window.removeLast()
            }
            window.append((value, x))
        }
        return answer
    }
}
