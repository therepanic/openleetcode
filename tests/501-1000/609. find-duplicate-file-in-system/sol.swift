class Solution {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var d = [String: [String]]()
        for path in paths {
            let parts = path.split(separator: " ")
            let directory = String(parts[0])
            for file in parts.dropFirst() {
                let fileStr = String(file)
                let parenIndex = fileStr.firstIndex(of: "(")!
                let name = String(fileStr[..<parenIndex])
                let content = String(fileStr[fileStr.index(after: parenIndex)..<fileStr.index(before: fileStr.endIndex)])
                let fullPath = directory + "/" + name
                d[content, default: []].append(fullPath)
            }
        }
        return d.values.filter { $0.count > 1 }
    }
}
