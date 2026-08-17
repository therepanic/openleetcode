class Node1948 {
    String name;
    Map<String, Node1948> children = {};
    String signature = "";
    
    Node1948(this.name) {
    }
  }

class Solution {
  
  Map<String, int> signatureCount = {};
  
  List<List<String>> deleteDuplicateFolder(List<List<String>> paths) {
    Node1948 root = Node1948("");
    
    for (var path in paths) {
      Node1948 node = root;
      for (var folder in path) {
        if (!node.children.containsKey(folder)) {
          node.children[folder] = Node1948(folder);
        }
        node = node.children[folder]!;
      }
    }
    
    dfs(root);
    
    List<List<String>> result = [];
    List<String> currentPath = [];
    
    List<String> sorted = root.children.keys.toList()..sort();
    for (var name in sorted) {
      dfs2(root.children[name]!, result, currentPath);
    }
    
    return result;
  }
  
  String dfs(Node1948 node) {
    if (node.children.isEmpty) {
      node.signature = "";
      return "";
    }
    List<String> childSignatures = [];
    List<String> sorted = node.children.keys.toList()..sort();
    for (var name in sorted) {
      Node1948 child = node.children[name]!;
      String childSignature = dfs(child);
      childSignatures.add("$name($childSignature)");
    }
    node.signature = childSignatures.join();
    signatureCount[node.signature] = (signatureCount[node.signature] ?? 0) + 1;
    return node.signature;
  }
  
  void dfs2(Node1948 node, List<List<String>> result, List<String> currentPath) {
    if (node.children.isNotEmpty && (signatureCount[node.signature] ?? 0) >= 2) {
      return;
    }
    currentPath.add(node.name);
    result.add(List.from(currentPath));
    List<String> sorted = node.children.keys.toList()..sort();
    for (var name in sorted) {
      dfs2(node.children[name]!, result, currentPath);
    }
    currentPath.removeLast();
  }
}
