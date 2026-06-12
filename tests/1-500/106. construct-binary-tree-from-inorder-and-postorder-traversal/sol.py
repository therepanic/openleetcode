# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right


class StateNode:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None


class Solution:
    def buildTree(self, inorder, postorder):

        idxMap = {}

        for i in range(len(inorder)):
            idxMap[inorder[i]] = i

        def buildState(l, r):

            if l > r:
                return None

            rootVal = postorder.pop()

            node = StateNode(rootVal)

            mid = idxMap[rootVal]

            node.right = buildState(mid + 1, r)
            node.left = buildState(l, mid - 1)

            return node

        def convert(node):

            if not node:
                return None

            root = TreeNode(node.val)

            root.left = convert(node.left)
            root.right = convert(node.right)

            return root

        stateRoot = buildState(0, len(inorder) - 1)

        return convert(stateRoot)
