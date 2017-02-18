class LongestPathInMatrix
  # Given a n*n matrix where numbers all numbers are distinct and are distributed from range 1 to n2,
  # this method finds a maximum length path (starting from any cell) such that all cells along the path
  # are increasing order with a difference of 1.
  def getPath(matrix)
    longestPath = []
    n = matrix.length
    startingPoints = createStartingPoints n

    startingPoints.each { |startingPoint|
      longestPathCandidate = getLongestPathFrom matrix, n, startingPoint[0], startingPoint[1], []

      longestPath = longestPathCandidate.length > longestPath.length ? longestPathCandidate
        : longestPath
    }

    longestPath.join('-')
  end

  private

  def createStartingPoints (n)
    startingPoints = []

    (0..n-1).each { |rowIndex|
      (0..n-1).each { |columnIndex|
        startingPoints.push [rowIndex, columnIndex]
      }
    }

    return startingPoints
  end

  def getLongestPathFrom(matrix, n, rowIndex, columnIndex, currentPath)
    currentPath = currentPath.clone
    currentPath.push matrix[rowIndex][columnIndex]
    adjacentElements = getAdjacentElements(matrix, n, rowIndex, columnIndex)

    successor = adjacentElements.find { |adjacentElement|
      matrix[adjacentElement[0]][adjacentElement[1]] == matrix[rowIndex][columnIndex] + 1
    }

    successor != nil ? getLongestPathFrom(matrix, n, successor[0], successor[1], currentPath)
      : currentPath
  end

  def getAdjacentElements(matrix, n, rowIndex, columnIndex)
    adjacentElements = []

    if columnIndex + 1 < n
      adjacentElements.push [rowIndex, columnIndex + 1]
    end

    if columnIndex - 1 >= 0
      adjacentElements.push [rowIndex, columnIndex - 1]
    end

    if rowIndex + 1 < n
      adjacentElements.push [rowIndex + 1, columnIndex]
    end

    if rowIndex - 1 >= 0
      adjacentElements.push [rowIndex - 1, columnIndex]
    end

    adjacentElements
  end
end
