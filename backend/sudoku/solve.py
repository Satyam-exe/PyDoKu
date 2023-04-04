def is_valid(puzzle, row, col, num):
    """
    Check if a number can be placed at a given position in the puzzle
    without violating the Sudoku constraints.
    """
    # Check row
    for i in range(9):
        if puzzle[row][i] == num and i != col:
            return False

    # Check column
    for i in range(9):
        if puzzle[i][col] == num and i != row:
            return False

    # Check sub-grid
    sub_row = (row // 3) * 3
    sub_col = (col // 3) * 3
    nums_occurred_in_subgrid = 0
    for i in range(3):
        for j in range(3):
            if puzzle[sub_row + i][sub_col + j] == num:
                if nums_occurred_in_subgrid == 0:
                    nums_occurred_in_subgrid += 1
                else:
                    return False

    return True


def find_empty_cell(puzzle):
    """Find an empty cell in the puzzle."""
    for i in range(9):
        for j in range(9):
            if puzzle[i][j] == 0:
                return i, j
    return None


def solve_sudoku(puzzle):
    """Solve a Sudoku puzzle using a recursive backtracking algorithm."""

    def solve():
        for i in range(9):
            for j in range(9):
                if puzzle[i][j] != 0 and not is_valid(puzzle, i, j, puzzle[i][j]):
                    return False
        # Find the next empty cell
        next_cell = find_empty_cell(puzzle)

        # If there are no more empty cells, the puzzle is solved
        if not next_cell:
            return True

        # Try each possible number for the empty cell
        row, col = next_cell
        for num in range(1, 10):
            if is_valid(puzzle, row, col, num):
                puzzle[row][col] = num
                if solve():
                    return True
                puzzle[row][col] = 0

        # If none of the numbers worked, backtrack
        return False

    # Start solving the puzzle
    if solve():
        return puzzle
    else:
        return None
