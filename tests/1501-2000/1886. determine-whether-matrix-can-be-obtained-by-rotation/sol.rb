# @param {Integer[][]} mat
# @param {Integer[][]} target
# @return {Boolean}
def find_rotation(mat, target)
    4.times do
        return true if mat == target
        # Rotate 90 degrees clockwise
        mat = mat.reverse.transpose
    end
    false
end
