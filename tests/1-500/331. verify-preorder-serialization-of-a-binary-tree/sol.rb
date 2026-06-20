# @param {String} preorder
# @return {Boolean}
def is_valid_serialization(preorder)
    slots = 1
    preorder.split(',').each do |node|
        slots -= 1
        return false if slots < 0
        slots += 2 if node != '#'
    end
    slots == 0
end
