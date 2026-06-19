class Solution {
    func strongPasswordChecker(_ password: String) -> Int {
        let lowercase = Set("abcdefghijklmnopqrstuvwxyz")
        let uppercase = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let digit = Set("0123456789")
        
        let characters = Set(password)
        
        let needsLowercase = characters.intersection(lowercase).isEmpty
        let needsUppercase = characters.intersection(uppercase).isEmpty
        let needsDigit = characters.intersection(digit).isEmpty
        let numRequiredTypeReplaces = (needsLowercase ? 1 : 0) + (needsUppercase ? 1 : 0) + (needsDigit ? 1 : 0)
        
        let numRequiredInserts = max(0, 6 - password.count)
        let numRequiredDeletes = max(0, password.count - 20)
        
        var groups = [Int]()
        if !password.isEmpty {
            var count = 1
            let arr = Array(password)
            for i in 1..<arr.count {
                if arr[i] == arr[i-1] {
                    count += 1
                } else {
                    groups.append(count)
                    count = 1
                }
            }
            groups.append(count)
        }
        
        for _ in 0..<numRequiredDeletes {
            var argmin = -1
            var minVal = Int.max
            for (i, group) in groups.enumerated() {
                let val = group >= 3 ? group % 3 : 10 - group
                if val < minVal {
                    minVal = val
                    argmin = i
                }
            }
            if argmin != -1 {
                groups[argmin] -= 1
            }
        }
        
        let numRequiredGroupReplaces = groups.reduce(0) { $0 + $1 / 3 }
        
        return numRequiredDeletes + max(numRequiredTypeReplaces, max(numRequiredGroupReplaces, numRequiredInserts))
    }
}
