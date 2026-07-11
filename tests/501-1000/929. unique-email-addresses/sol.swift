class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var res = Set<String>()
        for email in emails {
            let parts = email.split(separator: "@", maxSplits: 1)
            var local = String(parts[0])
            let domain = String(parts[1])
            
            if let plusIndex = local.firstIndex(of: "+") {
                local = String(local[..<plusIndex])
            }
            local = local.replacingOccurrences(of: ".", with: "")
            res.insert(local + "@" + domain)
        }
        return res.count
    }
}
