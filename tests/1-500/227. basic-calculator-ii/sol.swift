class Solution {
    func calculate(_ s: String) -> Int {
        var stack = [Int]()
        var n = 0
        var op: Character = "+"
        var str = s + "+"
        
        for c in str {
            if c == " " { continue }
            
            if c.isNumber {
                n = n * 10 + Int(String(c))!
                continue
            }
            
            switch op {
            case "+":
                stack.append(n)
            case "-":
                stack.append(-n)
            case "*":
                stack.append(stack.removeLast() * n)
            case "/":
                stack.append(stack.removeLast() / n)
            default:
                break
            }
            
            op = c
            n = 0
        }
        
        return stack.reduce(0, +)
    }
}
