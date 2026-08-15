# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isEvenOddTree(self, root: Optional[TreeNode]) -> bool:
        elements = [[]]

        def collect(temp, pos):
            if not temp:
                return True
            if len(elements) == pos:
                elements.append([])
            posCheck = pos % 2
            valCheck = temp.val % 2
            if posCheck == 0 and valCheck != 0:
                if elements[pos] and not elements[pos][-1] < temp.val:
                    return False
                elements[pos].append(temp.val)
            elif posCheck != 0 and valCheck == 0:
                if elements[pos] and not elements[pos][-1] > temp.val:
                    return False
                elements[pos].append(temp.val)
            else:
                return False
            return collect(temp.left, pos + 1) and collect(temp.right, pos + 1)

        return collect(root, 0)
