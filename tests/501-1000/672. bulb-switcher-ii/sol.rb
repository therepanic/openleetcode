# @param {Integer} n
# @param {Integer} presses
# @return {Integer}
def flip_lights(n, presses)
  if presses == 0
    return 1
  end
  if n == 1
    return 2
  end
  if n == 2 && presses == 1
    return 3
  end
  if n == 2 || presses == 1
    return 4
  end
  if presses == 2
    return 7
  end
  return 8
end
