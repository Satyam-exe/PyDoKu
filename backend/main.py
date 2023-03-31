from fastapi import FastAPI
from pydantic import BaseModel

from sudoku.solve import solve_sudoku

app = FastAPI()


class SolvePayload(BaseModel):
    sudoku_str: str


@app.post("/solve/")
async def say_hello(payload: SolvePayload = None):
    sudoku_str = payload.sudoku_str
    puzzle = []
    for i in range(9):
        row = [int(sudoku_str[9 * i + j]) if sudoku_str[9 * i + j] != '.' else 0 for j in range(9)]
        puzzle.append(row)
    solved_sudoku = solve_sudoku(puzzle)
    solved_sudoku_str = "".join(str(num) if num != 0 else "." for row in solved_sudoku for num in row)
    return {
        'puzzle': sudoku_str,
        'solution': solved_sudoku_str
    }
