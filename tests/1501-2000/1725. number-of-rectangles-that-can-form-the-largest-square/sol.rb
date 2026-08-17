# @param {Integer[][]} rectangles
# @return {Integer}
def count_good_rectangles(rectangles)
    max_len = rectangles.map { |rec| rec.min }.max
    rectangles.count { |rec| rec.min == max_len }
end
