# @param {Integer} radius
# @param {Integer} x_center
# @param {Integer} y_center
# @param {Integer} x1
# @param {Integer} y1
# @param {Integer} x2
# @param {Integer} y2
# @return {Boolean}
def check_overlap(radius, x_center, y_center, x1, y1, x2, y2)
    nearest_x = [x1, [x2, x_center].min].max
    nearest_y = [y1, [y2, y_center].min].max
    dist = (nearest_x - x_center) ** 2 + (nearest_y - y_center) ** 2
    dist <= radius * radius
end
