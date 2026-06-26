# @param {Integer[][]} arrays
# @return {Integer}
def max_distance(arrays)
    smallest = arrays[0][0]
    largest = arrays[0][-1]
    ans = 0
    (1...arrays.length).each do |i|
        ans = [ans, largest - arrays[i][0], arrays[i][-1] - smallest].max
        smallest = [arrays[i][0], smallest].min
        largest = [arrays[i][-1], largest].max
    end
    ans
end
