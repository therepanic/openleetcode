class Solution {
    func removeComments(_ source: [String]) -> [String] {
        var inBlock = false
        var ans = [String]()
        var newline = ""
        for line in source {
            var i = line.startIndex
            if !inBlock {
                newline = ""
            }
            while i < line.endIndex {
                let next = line.index(after: i)
                if next < line.endIndex && line[i] == "/" && line[next] == "*" && !inBlock {
                    inBlock = true
                    i = next
                } else if next < line.endIndex && line[i] == "*" && line[next] == "/" && inBlock {
                    inBlock = false
                    i = next
                } else if !inBlock && next < line.endIndex && line[i] == "/" && line[next] == "/" {
                    break
                } else if !inBlock {
                    newline.append(line[i])
                }
                i = line.index(after: i)
            }
            if !newline.isEmpty && !inBlock {
                ans.append(newline)
            }
        }
        return ans
    }
}
