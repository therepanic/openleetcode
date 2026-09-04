# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def getDirections(self, root: Optional[TreeNode], start: int, dest: int) -> str:
        graph = defaultdict(list)

        def build_graph(root):
            if not root:
                return
            
            if root.left:
                u, v = root.val, root.left.val
                graph[u].append((v, 'L'))
                graph[v].append((u, 'U'))
            
            if root.right:
                u, v = root.val, root.right.val
                graph[u].append((v, 'R'))
                graph[v].append((u, 'U'))
            
            build_graph(root.left)
            build_graph(root.right)
        
        build_graph(root)

        temp = []
        def build_path(node, prev):
            if node == dest:
                return True

            for adj_node, move in graph[node]:
                if adj_node == prev:
                    continue
                temp.append(move)
                if build_path(adj_node, node):
                    return True
                temp.pop()
            
            return False
        
        if build_path(start, -1):
            print("Done")
        
        return ''.join(temp)