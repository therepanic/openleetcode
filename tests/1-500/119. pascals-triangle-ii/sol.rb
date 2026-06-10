
def get_row(row_index)
  row = [1]
  row_index.times do
    row = ([0] + row).zip(row + [0]).map { |left, right| left + right }
  end
  row
end
