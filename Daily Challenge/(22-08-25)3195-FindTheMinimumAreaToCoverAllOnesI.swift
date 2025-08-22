class Solution {
    func minimumArea(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        
        var minRow = m, maxRow = -1
        var minCol = n, maxCol = -1
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    minRow = min(minRow, i)
                    maxRow = max(maxRow, i)
                    minCol = min(minCol, j)
                    maxCol = max(maxCol, j)
                }
            }
        }
        
        let height = maxRow - minRow + 1
        let width = maxCol - minCol + 1
        
        return height * width
    }
}
