class Solution {
    func maxPartitionsAfterOperations(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)
        var memo = [Int: Int]()  // key: compressed state (i, canChange, mask)
        
        func dfs(_ i: Int, _ canChange: Bool, _ mask: Int) -> Int {
            if i == chars.count {
                return 0
            }
            
            // Encode state into one Int key
            let key = (i << 27) | ((canChange ? 1 : 0) << 26) | mask
            if let val = memo[key] {
                return val
            }
            
            var res = getRes(i, canChange, mask, 1 << (chars[i].asciiValue! - Character("a").asciiValue!))
            
            if canChange {
                for j in 0..<26 {
                    res = max(res, getRes(i, false, mask, 1 << j))
                }
            }
            
            memo[key] = res
            return res
        }
        
        func getRes(_ i: Int, _ nextCanChange: Bool, _ mask: Int, _ newBit: Int) -> Int {
            let newMask = mask | newBit
            if newMask.nonzeroBitCount > k {
                // Start a new partition
                return 1 + dfs(i + 1, nextCanChange, newBit)
            } else {
                // Continue same partition
                return dfs(i + 1, nextCanChange, newMask)
            }
        }
        
        return dfs(0, true, 0) + 1
    }
}
