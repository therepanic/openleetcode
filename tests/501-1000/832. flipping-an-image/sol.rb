# @param {Integer[][]} image
# @return {Integer[][]}
def flip_and_invert_image(image)
    image.each do |row|
        left, right = 0, row.length - 1
        while left <= right
            row[left], row[right] = 1 - row[right], 1 - row[left]
            left += 1
            right -= 1
        end
    end
    image
end
