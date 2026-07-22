class Solution:
    def inorder(self, node, vals):
        if not node:
            return
        self.inorder(node.left, vals)
        vals.append(node.val)
        self.inorder(node.right, vals)

    def build(self, vals, l, r):
        if l > r:
            return None
        mid = (l + r) // 2
        node = TreeNode(vals[mid])
        node.left = self.build(vals, l, mid - 1)
        node.right = self.build(vals, mid + 1, r)
        return node

    def balanceBST(self, root):
        vals = []
        self.inorder(root, vals)
        return self.build(vals, 0, len(vals) - 1)
