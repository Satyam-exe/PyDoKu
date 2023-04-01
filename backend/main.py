from flask import Flask, request
from sudoku.solve import solve_sudoku

app = Flask(__name__)


@app.route('/solve/', methods=['POST'])
def solve_sudoku_api():
    sudoku_str = request.json['sudoku_str']
    puzzle = []
    for i in range(9):
        row = [int(sudoku_str[9 * i + j]) if sudoku_str[9 * i + j] != '.' else 0 for j in range(9)]
        puzzle.append(row)
    solved_sudoku = solve_sudoku(puzzle)
    if solved_sudoku:
        solved_sudoku_str = "".join(str(num) if num != 0 else "." for row in solved_sudoku for num in row)
        return {
            'puzzle': sudoku_str,
            'solution': solved_sudoku_str
        }
    else:
        return {
            'puzzle': sudoku_str,
            'error': 'unsolvable'
        }


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
