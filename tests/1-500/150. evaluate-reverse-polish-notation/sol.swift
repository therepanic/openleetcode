class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            switch token {
            case "+", "-", "*", "/":
                let b = stack.removeLast()
                let a = stack.removeLast()
                let value: Int
                switch token {
                case "+": value = a + b
                case "-": value = a - b
                case "*": value = a * b
                default: value = a / b
                }
                stack.append(value)
            default:
                stack.append(Int(token)!)
            }
        }
        return stack.last!
    }
}
