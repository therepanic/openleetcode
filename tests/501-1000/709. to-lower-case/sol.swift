class Solution {
    func toLowerCase(_ s: String) -> String {
        var result = ""
        for ch in s {
            let ascii = ch.asciiValue!
            if ascii >= 65 && ascii <= 90 {
                result.append(Character(UnicodeScalar(ascii + 32)))
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
