func deleteDuplicateFolder(paths [][]string) [][]string {
    type Node struct {
        name     string
        children map[string]*Node
        signature string
    }
    
    root := &Node{name: "", children: make(map[string]*Node)}
    
    for _, path := range paths {
        node := root
        for _, folder := range path {
            if _, ok := node.children[folder]; !ok {
                node.children[folder] = &Node{name: folder, children: make(map[string]*Node)}
            }
            node = node.children[folder]
        }
    }
    
    signatureCount := make(map[string]int)
    
    var dfs func(node *Node) string
    dfs = func(node *Node) string {
        if len(node.children) == 0 {
            node.signature = ""
            return ""
        }
        childSignatures := make([]string, 0)
        sortedKeys := make([]string, 0, len(node.children))
        for name := range node.children {
            sortedKeys = append(sortedKeys, name)
        }
        sort.Strings(sortedKeys)
        for _, name := range sortedKeys {
            child := node.children[name]
            childSignature := dfs(child)
            childSignatures = append(childSignatures, name+"("+childSignature+")")
        }
        node.signature = ""
        for _, s := range childSignatures {
            node.signature += s
        }
        signatureCount[node.signature]++
        return node.signature
    }
    
    dfs(root)
    
    result := make([][]string, 0)
    currentPath := make([]string, 0)
    
    var dfs2 func(node *Node)
    dfs2 = func(node *Node) {
        if len(node.children) > 0 && signatureCount[node.signature] >= 2 {
            return
        }
        currentPath = append(currentPath, node.name)
        result = append(result, append([]string{}, currentPath...))
        
        sortedKeys := make([]string, 0, len(node.children))
        for name := range node.children {
            sortedKeys = append(sortedKeys, name)
        }
        sort.Strings(sortedKeys)
        for _, name := range sortedKeys {
            dfs2(node.children[name])
        }
        currentPath = currentPath[:len(currentPath)-1]
    }
    
    sortedKeys := make([]string, 0, len(root.children))
    for name := range root.children {
        sortedKeys = append(sortedKeys, name)
    }
    sort.Strings(sortedKeys)
    for _, name := range sortedKeys {
        dfs2(root.children[name])
    }
    
    return result
}
