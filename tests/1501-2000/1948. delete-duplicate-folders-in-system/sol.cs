using System;
using System.Collections.Generic;
using System.Linq;

public class Solution {
    private class Node {
        public string Name;
        public Dictionary<string, Node> Children = new Dictionary<string, Node>();
        public string Signature = "";
        
        public Node(string name) {
            Name = name;
        }
    }
    
    private Dictionary<string, int> signatureCount = new Dictionary<string, int>();
    
    public IList<IList<string>> DeleteDuplicateFolder(IList<IList<string>> paths) {
        Node root = new Node("");
        
        foreach (var path in paths) {
            Node node = root;
            foreach (var folder in path) {
                if (!node.Children.ContainsKey(folder)) {
                    node.Children[folder] = new Node(folder);
                }
                node = node.Children[folder];
            }
        }
        
        Dfs(root);
        
        var result = new List<IList<string>>();
        var currentPath = new List<string>();
        
        var sorted = root.Children.Keys.OrderBy(x => x).ToList();
        foreach (var name in sorted) {
            Dfs2(root.Children[name], result, currentPath);
        }
        
        return result;
    }
    
    private string Dfs(Node node) {
        if (node.Children.Count == 0) {
            node.Signature = "";
            return "";
        }
        
        var childSignatures = new List<string>();
        var sorted = node.Children.Keys.OrderBy(x => x).ToList();
        foreach (var name in sorted) {
            var child = node.Children[name];
            var childSignature = Dfs(child);
            childSignatures.Add($"{name}({childSignature})");
        }
        
        node.Signature = string.Join("", childSignatures);
        signatureCount[node.Signature] = signatureCount.GetValueOrDefault(node.Signature) + 1;
        return node.Signature;
    }
    
    private void Dfs2(Node node, IList<IList<string>> result, List<string> currentPath) {
        if (node.Children.Count > 0 && signatureCount.GetValueOrDefault(node.Signature) >= 2) {
            return;
        }
        
        currentPath.Add(node.Name);
        result.Add(new List<string>(currentPath));
        
        var sorted = node.Children.Keys.OrderBy(x => x).ToList();
        foreach (var name in sorted) {
            Dfs2(node.Children[name], result, currentPath);
        }
        
        currentPath.RemoveAt(currentPath.Count - 1);
    }
}
