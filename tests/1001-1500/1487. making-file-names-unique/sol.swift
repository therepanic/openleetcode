class Solution {
    func getFolderNames(_ names: [String]) -> [String] {
        var nameCount = [String: Int]()
        var result = [String]()

        for name in names {
            if nameCount[name] == nil {
                result.append(name)
                nameCount[name] = 1
            } else {
                var k = nameCount[name]!
                while nameCount["\(name)(\(k))"] != nil {
                    k += 1
                }
                let newName = "\(name)(\(k))"
                result.append(newName)
                nameCount[name] = k + 1
                nameCount[newName] = 1
            }
        }

        return result
    }
}
