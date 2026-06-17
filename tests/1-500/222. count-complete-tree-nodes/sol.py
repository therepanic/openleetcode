class Solution(object):
    def countNodes(self, root):
        if not root:
            return 0
        
        left_depth = self.getDepth(root.left)
        right_depth = self.getDepth(root.right)
        
        if left_depth == right_depth:
            return (1 << left_depth) + self.countNodes(root.right)
        else:
            return (1 << right_depth) + self.countNodes(root.left)
    
    def getDepth(self, node):
        depth = 0
        while node:
            depth += 1
            node = node.left
        return depth