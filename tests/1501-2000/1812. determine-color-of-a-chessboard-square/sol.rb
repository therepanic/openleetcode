# @param {String} coordinates
# @return {Boolean}
def square_is_white(coordinates)
    (coordinates[0].ord - coordinates[1].to_i) % 2 != 0
end
