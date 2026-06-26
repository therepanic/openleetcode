class Solution(object):
    def convertBST(self, root):
        self.total = 0

        def traverse(node):
            if not node:
                return
            traverse(node.right)
            self.total += node.val
            node.val = self.total
            traverse(node.left)

        traverse(root)
        return root
