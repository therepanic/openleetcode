class Solution {
    class Node {
        var name: String
        var children: [String: Node] = [:]
        var signature: String = ""
        
        init(_ name: String) {
            self.name = name
        }
    }
    
    var signatureCount: [String: Int] = [:]
    
    func deleteDuplicateFolder(_ paths: [[String]]) -> [[String]] {
        let root = Node("")
        
        for path in paths {
            var node = root
            for folder in path {
                if node.children[folder] == nil {
                    node.children[folder] = Node(folder)
                }
                node = node.children[folder]!
            }
        }
        
        _ = dfs(root)
        
        var result: [[String]] = []
        var currentPath: [String] = []
        
        let sorted = root.children.keys.sorted()
        for name in sorted {
            dfs2(root.children[name]!, &result, &currentPath)
        }
        
        return result
    }
    
    func dfs(_ node: Node) -> String {
        if node.children.isEmpty {
            node.signature = ""
            return ""
        }
        
        var childSignatures: [String] = []
        let sorted = node.children.keys.sorted()
        for name in sorted {
            let child = node.children[name]!
            let childSignature = dfs(child)
            childSignatures.append("\(name)(\(childSignature))")
        }
        
        node.signature = childSignatures.joined()
        signatureCount[node.signature, default: 0] += 1
        return node.signature
    }
    
    func dfs2(_ node: Node, _ result: inout [[String]], _ currentPath: inout [String]) {
        if !node.children.isEmpty && (signatureCount[node.signature] ?? 0) >= 2 {
            return
        }
        
        currentPath.append(node.name)
        result.append(currentPath)
        
        let sorted = node.children.keys.sorted()
        for name in sorted {
            dfs2(node.children[name]!, &result, &currentPath)
        }
        currentPath.removeLast()
    }
}
