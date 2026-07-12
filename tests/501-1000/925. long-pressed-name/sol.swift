class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        let nameChars = Array(name)
        let typedChars = Array(typed)
        var i = 0
        var j = 0
        
        while j < typedChars.count {
            if i < nameChars.count && nameChars[i] == typedChars[j] {
                i += 1
                j += 1
            } else if j > 0 && typedChars[j] == typedChars[j - 1] {
                j += 1
            } else {
                return false
            }
        }
        
        return i == nameChars.count
    }
}
