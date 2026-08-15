import java.util.*;

class Solution {
    private class Node {
        String name;
        Map<String, Node> children = new HashMap<>();
        String signature = "";
        
        Node(String name) {
            this.name = name;
        }
    }
    
    private Map<String, Integer> signatureCount = new HashMap<>();

    public List<List<String>> deleteDuplicateFolder(List<List<String>> paths) {
        String[][] pathArray = new String[paths.size()][];
        for (int i = 0; i < paths.size(); i++) {
            pathArray[i] = paths.get(i).toArray(new String[0]);
        }
        return deleteDuplicateFolder(pathArray);
    }

    public List<List<String>> deleteDuplicateFolder(String[][] paths) {
        Node root = new Node("");
        
        for (String[] path : paths) {
            Node node = root;
            for (String folder : path) {
                if (!node.children.containsKey(folder)) {
                    node.children.put(folder, new Node(folder));
                }
                node = node.children.get(folder);
            }
        }
        
        dfs(root);
        
        List<List<String>> result = new ArrayList<>();
        List<String> currentPath = new ArrayList<>();
        
        List<String> sorted = new ArrayList<>(root.children.keySet());
        Collections.sort(sorted);
        for (String name : sorted) {
            dfs2(root.children.get(name), result, currentPath);
        }
        
        return result;
    }
    
    private String dfs(Node node) {
        if (node.children.isEmpty()) {
            node.signature = "";
            return "";
        }
        List<String> childSignatures = new ArrayList<>();
        List<String> sorted = new ArrayList<>(node.children.keySet());
        Collections.sort(sorted);
        for (String name : sorted) {
            Node child = node.children.get(name);
            String childSignature = dfs(child);
            childSignatures.add(name + "(" + childSignature + ")");
        }
        node.signature = String.join("", childSignatures);
        signatureCount.put(node.signature, signatureCount.getOrDefault(node.signature, 0) + 1);
        return node.signature;
    }
    
    private void dfs2(Node node, List<List<String>> result, List<String> currentPath) {
        if (!node.children.isEmpty() && signatureCount.get(node.signature) >= 2) {
            return;
        }
        currentPath.add(node.name);
        result.add(new ArrayList<>(currentPath));
        List<String> sorted = new ArrayList<>(node.children.keySet());
        Collections.sort(sorted);
        for (String name : sorted) {
            dfs2(node.children.get(name), result, currentPath);
        }
        currentPath.remove(currentPath.size() - 1);
    }
}
