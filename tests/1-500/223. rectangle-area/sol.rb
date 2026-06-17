# @param {Integer} ax1
# @param {Integer} ay1
# @param {Integer} ax2
# @param {Integer} ay2
# @param {Integer} bx1
# @param {Integer} by1
# @param {Integer} bx2
# @param {Integer} by2
# @return {Integer}
def compute_area(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)
    area1 = (ax2 - ax1) * (ay2 - ay1)
    area2 = (bx2 - bx1) * (by2 - by1)

    overlap_width = [0, [ax2, bx2].min - [ax1, bx1].max].max
    overlap_height = [0, [ay2, by2].min - [ay1, by1].max].max
    overlap_area = overlap_width * overlap_height

    total_area = area1 + area2 - overlap_area
    return total_area
end
