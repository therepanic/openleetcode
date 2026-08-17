class Solution {
    private class Node(val name: String) {
        val children = mutableMapOf<String, Node>()
        var signature: String = ""
    }
    
    private val signatureCount = mutableMapOf<String, Int>()

    fun deleteDuplicateFolder(paths: List<List<String>>): List<List<String>> {
        return deleteDuplicateFolder(paths.map { it.toTypedArray() }.toTypedArray())
    }
    
    fun deleteDuplicateFolder(paths: Array<Array<String>>): List<List<String>> {
        val root = Node("")
        
        for (path in paths) {
            var node = root
            for (folder in path) {
                if (!node.children.containsKey(folder)) {
                    node.children[folder] = Node(folder)
                }
                node = node.children[folder]!!
            }
        }
        
        dfs(root)
        
        val result = mutableListOf<List<String>>()
        val currentPath = mutableListOf<String>()
        
        root.children.keys.sorted().forEach { name ->
            dfs2(root.children[name]!!, result, currentPath)
        }
        
        return result
    }
    
    private fun dfs(node: Node): String {
        if (node.children.isEmpty()) {
            node.signature = ""
            return ""
        }
        val childSignatures = mutableListOf<String>()
        node.children.keys.sorted().forEach { name ->
            val child = node.children[name]!!
            val childSignature = dfs(child)
            childSignatures.add("$name($childSignature)")
        }
        node.signature = childSignatures.joinToString("")
        signatureCount[node.signature] = signatureCount.getOrDefault(node.signature, 0) + 1
        return node.signature
    }
    
    private fun dfs2(node: Node, result: MutableList<List<String>>, currentPath: MutableList<String>) {
        if (node.children.isNotEmpty() && signatureCount[node.signature]!! >= 2) {
            return
        }
        currentPath.add(node.name)
        result.add(currentPath.toList())
        node.children.keys.sorted().forEach { name ->
            dfs2(node.children[name]!!, result, currentPath)
        }
        currentPath.removeAt(currentPath.size - 1)
    }
}
