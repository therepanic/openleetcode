class Solution {
    func solveEquation(_ equation: String) -> String {
        let parts = equation.split(separator: "=")
        let left = parseSide(String(parts[0]))
        let right = parseSide(String(parts[1]))
        
        let coeff = left.coeff - right.coeff
        let constant = right.constant - left.constant
        
        if coeff == 0 {
            return constant != 0 ? "No solution" : "Infinite solutions"
        }
        return "x=\(constant / coeff)"
    }
    
    private func parseSide(_ side: String) -> (coeff: Int, constant: Int) {
        var coeff = 0
        var constant = 0
        var num = ""
        var sign = 1
        let expanded = side + "+"
        
        for char in expanded {
            if char == "+" || char == "-" {
                if !num.isEmpty {
                    constant += sign * Int(num)!
                    num = ""
                }
                sign = char == "+" ? 1 : -1
            } else if char.isNumber {
                num += String(char)
            } else if char == "x" {
                coeff += sign * (num.isEmpty ? 1 : Int(num)!)
                num = ""
            }
        }
        return (coeff, constant)
    }
}
