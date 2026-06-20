# @param {Integer[][]} height_map
# @return {Integer}
def trap_rain_water(height_map)
  return 0 if height_map.empty? || height_map.length < 3 || height_map[0].length < 3

  m, n = height_map.length, height_map[0].length
  visited = Array.new(m) { Array.new(n, false) }
  heap = []

  (0...m).each do |i|
    heap.push([height_map[i][0], i, 0])
    heap.push([height_map[i][n - 1], i, n - 1])
    visited[i][0] = visited[i][n - 1] = true
  end
  (0...n).each do |j|
    heap.push([height_map[0][j], 0, j])
    heap.push([height_map[m - 1][j], m - 1, j])
    visited[0][j] = visited[m - 1][j] = true
  end

  heap.sort_by! { |a| a[0] }
  result = 0
  directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]

  until heap.empty?
    height, x, y = heap.shift

    directions.each do |dx, dy|
      nx = x + dx
      ny = y + dy
      if nx >= 0 && nx < m && ny >= 0 && ny < n && !visited[nx][ny]
        result += [0, height - height_map[nx][ny]].max
        heap.push([[height, height_map[nx][ny]].max, nx, ny])
        visited[nx][ny] = true
      end
    end
    heap.sort_by! { |a| a[0] }
  end

  result
end
