class Solution {
    func calPoints(_ operations: [String]) -> Int {
        var stack = [Int]()
        for op in operations {
            if op == "C" {
                stack.removeLast()
            } else if op == "D" {
                stack.append(stack.last! * 2)
            } else if op == "+" {
                stack.append(stack.last! + stack[stack.count - 2])
            } else {
                stack.append(Int(op)!)
            }
        }
        return stack.reduce(0, +)
    }
}
