class Solution {
    func checkIfPangram(_ sentence: String) -> Bool {
        if sentence.count < 26 { return false }
        
        for i in 0..<26 {
            if !sentence.contains(String(UnicodeScalar(97+i)!)) { return false }
        }
        return true
    }
}
