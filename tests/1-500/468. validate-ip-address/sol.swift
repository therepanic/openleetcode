class Solution {
    func validIPAddress(_ queryIP: String) -> String {
        if queryIP.filter({ $0 == "." }).count == 3 {
            let parts = queryIP.split(separator: ".", omittingEmptySubsequences: false)
            var valid = true
            for p in parts {
                guard let num = Int(p), String(num) == p, num >= 0, num <= 255 else {
                    valid = false
                    break
                }
            }
            if valid { return "IPv4" }
        } else if queryIP.filter({ $0 == ":" }).count == 7 {
            let parts = queryIP.split(separator: ":", omittingEmptySubsequences: false)
            let hexChars = CharacterSet(charactersIn: "0123456789abcdefABCDEF")
            var valid = true
            for p in parts {
                if p.count < 1 || p.count > 4 || p.unicodeScalars.contains(where: { !hexChars.contains($0) }) {
                    valid = false
                    break
                }
            }
            if valid { return "IPv6" }
        }
        return "Neither"
    }
}
