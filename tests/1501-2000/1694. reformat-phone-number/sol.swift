class Solution {
    func reformatNumber(_ number: String) -> String {
        var phoneCleared = number.filter { $0.isNumber }
        var result: [String] = []
        
        while phoneCleared.count > 4 {
            result.append(String(phoneCleared.prefix(3)))
            phoneCleared = String(phoneCleared.dropFirst(3))
        }
        
        if phoneCleared.count == 4 {
            result.append(String(phoneCleared.prefix(2)))
            result.append(String(phoneCleared.suffix(2)))
        } else if !phoneCleared.isEmpty {
            result.append(phoneCleared)
        }
        
        return result.joined(separator: "-")
    }
}
