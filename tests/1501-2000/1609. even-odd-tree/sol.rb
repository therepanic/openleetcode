# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}
def is_even_odd_tree(root)
    elements = [[]]
    collect = lambda do |temp, pos|
        return true if temp.nil?
        elements << [] if elements.length == pos
        pos_check = pos % 2
        val_check = temp.val % 2
        if pos_check == 0 && val_check != 0
            return false if !elements[pos].empty? && !(elements[pos][-1] < temp.val)
            elements[pos] << temp.val
        elsif pos_check != 0 && val_check == 0
            return false if !elements[pos].empty? && !(elements[pos][-1] > temp.val)
            elements[pos] << temp.val
        else
            return false
        end
        collect.call(temp.left, pos + 1) && collect.call(temp.right, pos + 1)
    end
    collect.call(root, 0)
end
