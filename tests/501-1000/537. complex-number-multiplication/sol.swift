class Solution {
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        func parseComplex(_ s: String) -> (Int, Int) {
            let parts = s.split(separator: "+")
            let real = Int(parts[0])!
            let imag = Int(parts[1].dropLast())!
            return (real, imag)
        }
        
        let (a, b) = parseComplex(num1)
        let (c, d) = parseComplex(num2)
        let realPart = a * c - b * d
        let imagPart = a * d + b * c
        return "\(realPart)+\(imagPart)i"
    }
}
