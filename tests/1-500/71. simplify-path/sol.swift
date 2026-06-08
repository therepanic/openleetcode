class Solution {
    func simplifyPath(_ path: String) -> String {
        var parts = [String]()
        for part in path.split(separator: "/", omittingEmptySubsequences: false) {
            let value = String(part)
            if value.isEmpty || value == "." {
                continue
            }
            if value == ".." {
                if !parts.isEmpty {
                    parts.removeLast()
                }
            } else {
                parts.append(value)
            }
        }
        return "/" + parts.joined(separator: "/")
    }
}
