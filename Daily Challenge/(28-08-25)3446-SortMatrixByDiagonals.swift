class Solution {
    func sortMatrix(_ grid: [[Int]]) -> [[Int]] {
        var n = grid.count
        var result = grid
        
        // Dictionary to hold diagonals by (i - j)
        var diagonals = [Int: [Int]]()
        
        // Step 1: Collect diagonals
        for i in 0..<n {
            for j in 0..<n {
                let key = i - j
                diagonals[key, default: []].append(grid[i][j])
            }
        }
        
        // Step 2: Sort diagonals
        for (key, arr) in diagonals {
            if key >= 0 {
                diagonals[key] = arr.sorted(by: >)  // bottom-left → descending
            } else {
                diagonals[key] = arr.sorted(by: <)  // top-right → ascending
            }
        }
        
        // Step 3: Put back sorted diagonals
        var indices = [Int: Int]() // track where we are in each diagonal
        for i in 0..<n {
            for j in 0..<n {
                let key = i - j
                let idx = indices[key, default: 0]
                result[i][j] = diagonals[key]![idx]
                indices[key] = idx + 1
            }
        }
        
        return result
    }
}
