class Solution(object):
    def kthSmallest(self, root, k):
        def inorder_traversal(node):
            if not node:
                return []
            return (
                inorder_traversal(node.left)
                + [node.val]
                + inorder_traversal(node.right)
            )

        sorted_elements = inorder_traversal(root)
        return sorted_elements[k - 1]
