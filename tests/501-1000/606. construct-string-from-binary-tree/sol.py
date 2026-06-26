class Solution(object):
    def tree2str(self, root):
        if not root:
            return ""
        s = str(root.val)
        if root.left or root.right:
            s += "(" + self.tree2str(root.left) + ")"
        if root.right:
            s += "(" + self.tree2str(root.right) + ")"
        return s
