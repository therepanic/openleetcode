class Solution {
    func diffWaysToCompute(_ expression: String) -> [Int] {
        if let num = Int(expression) {
            return [num]
        }
        
        var results: [Int] = []
        let chars = Array(expression)
        
        for (i, char) in chars.enumerated() {
            if char == "+" || char == "-" || char == "*" {
                let leftResults = diffWaysToCompute(String(chars[0..<i]))
                let rightResults = diffWaysToCompute(String(chars[i+1..<chars.count]))
                
                for left in leftResults {
                    for right in rightResults {
                        if char == "+" {
                            results.append(left + right)
                        } else if char == "-" {
                            results.append(left - right)
                        } else if char == "*" {
                            results.append(left * right)
                        }
                    }
                }
            }
        }
        
        return results
    }
}
