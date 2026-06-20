class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        
        var arr = [Int](repeating: 0, count: 26)
        let sChars = Array(s)
        let tChars = Array(t)
        
        for i in 0..<sChars.count {
            arr[Int(sChars[i].asciiValue! - Character("a").asciiValue!)] += 1
            arr[Int(tChars[i].asciiValue! - Character("a").asciiValue!)] -= 1
        }
        
        for check in arr {
            if check != 0 {
                return false
            }
        }
        
        return true
    }
}
