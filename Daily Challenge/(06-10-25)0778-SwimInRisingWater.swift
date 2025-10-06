import Foundation

class Solution {
    func swimInWater(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        
        // Min-heap: (elevation, row, col)
        var heap = [(Int, Int, Int)]()
        func push(_ val: (Int, Int, Int)) {
            heap.append(val)
            heap.sort { $0.0 < $1.0 }  // simple sort-based min heap
        }
        func pop() -> (Int, Int, Int) {
            return heap.removeFirst()
        }
        
        push((grid[0][0], 0, 0))
        visited[0][0] = true
        var res = 0
        
        let directions = [(1,0), (-1,0), (0,1), (0,-1)]
        
        while !heap.isEmpty {
            let (elev, r, c) = pop()
            res = max(res, elev)
            
            if r == n - 1 && c == n - 1 {
                return res
            }
            
            for (dr, dc) in directions {
                let nr = r + dr, nc = c + dc
                if nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc] {
                    visited[nr][nc] = true
                    push((grid[nr][nc], nr, nc))
                }
            }
        }
        
        return res
    }
}
