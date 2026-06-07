class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        let bytes1 = Array(num1.utf8)
        let bytes2 = Array(num2.utf8)
        let n = bytes1.count
        let m = bytes2.count
        var result = Array(repeating: 0, count: n + m)

        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in stride(from: m - 1, through: 0, by: -1) {
                let mul = Int(bytes1[i] - 48) * Int(bytes2[j] - 48)
                let sum = mul + result[i + j + 1]
                result[i + j + 1] = sum % 10
                result[i + j] += sum / 10
            }
        }

        var k = 0
        while k < result.count && result[k] == 0 {
            k += 1
        }
        if k == result.count {
            return "0"
        }

        var product = ""
        for i in k..<result.count {
            product.append(String(result[i]))
        }
        return product
    }
}
