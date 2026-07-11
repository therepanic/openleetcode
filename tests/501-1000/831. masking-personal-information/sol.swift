class Solution {
    func maskPII(_ s: String) -> String {
        if s.contains("@") {
            let parts = s.split(separator: "@")
            var name = parts[0].lowercased()
            let domain = parts[1].lowercased()
            name = String(name.first!) + "*****" + String(name.last!)
            return name + "@" + domain
        } else {
            var gg = ""
            for x in s {
                if x.isNumber {
                    gg.append(x)
                }
            }
            let l = gg.count
            if l > 10 {
                return "+" + String(repeating: "*", count: l - 10) + "-***-***-" + String(gg.suffix(4))
            }
            return "***-***-" + String(gg.suffix(4))
        }
    }
}
