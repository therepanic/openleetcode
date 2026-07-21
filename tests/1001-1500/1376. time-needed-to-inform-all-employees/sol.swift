class Solution {
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var children = [[Int]](repeating: [], count: n)
        for (employee, parent) in manager.enumerated() {
            if parent != -1 {
                children[parent].append(employee)
            }
        }
        var stack = [(headID, 0)]
        var answer = 0
        while !stack.isEmpty {
            let (employee, elapsed) = stack.removeLast()
            answer = max(answer, elapsed)
            for child in children[employee] {
                stack.append((child, elapsed + informTime[employee]))
            }
        }
        return answer
    }
}
