class Solution(object):
    def isSubtree(self, root, subRoot):
        def ser(n):
            if not n:
                return ",#"
            return "," + str(n.val) + ser(n.left) + ser(n.right)

        return ser(subRoot) in ser(root)
