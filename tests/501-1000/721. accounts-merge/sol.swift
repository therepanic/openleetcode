class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        let n = accounts.count
        var location = [String: Set<Int>]()
        var content = [Set<String>]()
        
        for i in 0..<n {
            let name = accounts[i][0]
            location[name, default: []].insert(i)
            content.append(Set(accounts[i].dropFirst()))
        }
        
        for (name, var indices) in location {
            for i in indices {
                for j in indices {
                    if i != j && !content[i].isDisjoint(with: content[j]) {
                        content[j].formUnion(content[i])
                        indices.remove(i)
                        location[name] = indices
                        break
                    }
                }
            }
        }
        
        var result = [[String]]()
        for (name, indices) in location {
            for idx in indices {
                result.append([name] + content[idx].sorted())
            }
        }
        return result
    }
}
