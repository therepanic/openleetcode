class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var freq = [String: Int]()
        for entry in cpdomains {
            let comps = entry.split(separator: " ")
            let cnt = Int(comps[0])!
            let dom = String(comps[1])
            let parts = dom.split(separator: ".")
            for i in parts.indices {
                let sub = parts[i...].joined(separator: ".")
                freq[sub, default: 0] += cnt
            }
        }
        return freq.map { "\($0.value) \($0.key)" }
    }
}
