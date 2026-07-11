class Solution {
    func ambiguousCoordinates(_ s: String) -> [String] {
        let str = String(s.dropFirst().dropLast())
        var finalResults: [String] = []
        
        func getValidNumbers(_ numStr: String) -> [String] {
            var res: [String] = []
            let chars = Array(numStr)
            
            for i in 1...chars.count {
                let left = String(chars[0..<i])
                let right = i < chars.count ? String(chars[i...]) : ""
                
                if (left.count > 1 && left.hasPrefix("0")) || (right.hasSuffix("0")) {
                    continue
                }
                
                if right.isEmpty {
                    res.append(left)
                } else {
                    res.append("\(left).\(right)")
                }
            }
            
            return res
        }
        
        for i in 1..<str.count {
            let index = str.index(str.startIndex, offsetBy: i)
            let xOptions = getValidNumbers(String(str[str.startIndex..<index]))
            let yOptions = getValidNumbers(String(str[index...]))
            
            for x in xOptions {
                for y in yOptions {
                    finalResults.append("(\(x), \(y))")
                }
            }
        }
        
        return finalResults
    }
}
