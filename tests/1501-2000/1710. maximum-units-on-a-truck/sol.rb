# @param {Integer[][]} box_types
# @param {Integer} truck_size
# @return {Integer}
def maximum_units(box_types, truck_size)
    box_types.sort_by! { |x| -x[1] }
    ans = 0
    box_types.each do |a, b|
        quantitytaken = [truck_size, a].min
        ans += b * quantitytaken
        truck_size -= quantitytaken
        break if truck_size == 0
    end
    ans
end
