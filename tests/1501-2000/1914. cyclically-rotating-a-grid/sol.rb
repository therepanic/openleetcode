# @param {Integer[][]} grid

# @param {Integer} k

# @return {Integer[][]}

def rotate_grid(grid, k)

    t, l = 0, 0

    b, r = grid.length - 1, grid[0].length - 1

    while t < b && l < r

        ln = b - t

        wid = r - l

        perimeter = 2 * ln + 2 * wid

        steps = k % perimeter

        while steps > 0

            tmp = grid[t][l]

            (l...r).each do |i|

                grid[t][i] = grid[t][i + 1]

            end

            (t...b).each do |i|

                grid[i][r] = grid[i + 1][r]

            end

            (l + 1..r).reverse_each do |i|

                grid[b][i] = grid[b][i - 1]

            end

            (t + 1..b).reverse_each do |i|

                grid[i][l] = grid[i - 1][l]

            end

            grid[t + 1][l] = tmp

            steps -= 1

        end

        t += 1

        l += 1

        b -= 1

        r -= 1

    end

    grid

end
