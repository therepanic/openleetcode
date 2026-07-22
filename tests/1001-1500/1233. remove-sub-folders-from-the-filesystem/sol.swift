class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        let folder = folder.sorted()
        var res: [String] = []
        for f in folder {
            if res.isEmpty {
                res.append(f)
            } else {
                let prev = res.last!
                if f.hasPrefix(prev) && f.count > prev.count {
                    let index = f.index(f.startIndex, offsetBy: prev.count)
                    if f[index] == "/" {
                        continue
                    }
                }
                res.append(f)
            }
        }
        return res
    }
}
