# @param {Integer} hour
# @param {Integer} minutes
# @return {Float}
def angle_clock(hour, minutes)
    Math.acos(Math.cos((330 * hour + 5.5 * minutes) * 0.0174532925)) * 57.2957795
end
