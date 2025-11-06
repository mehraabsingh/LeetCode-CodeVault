import Foundation

// A Disjoint Set Union (DSU) structure, also known as Union-Find,
// is used to efficiently manage the connected components (power grids).
struct DSU {
    // parent[i] stores the parent of node i.
    // If parent[i] == i, then i is the representative (root) of its set.
    var parent: [Int]

    // Initializes the DSU structure for 'size' nodes (using 1-based indexing)
    init(size: Int) {
        // We create an array of size + 1 to handle 1-based indexing easily.
        // Initially, every node is its own parent.
        self.parent = Array(0...size)
    }

    // Finds the representative (root) of the set containing node 'i'
    // Uses path compression for efficiency.
    mutating func find(_ i: Int) -> Int {
        // If i is its own parent, it's the root.
        if parent[i] == i {
            return i
        }
        // Recursively find the root and set parent[i] directly to it.
        // This is path compression.
        parent[i] = find(parent[i])
        return parent[i]
    }

    // Merges the sets containing nodes 'i' and 'j'.
    mutating func union(_ i: Int, _ j: Int) {
        let rootI = find(i)
        let rootJ = find(j)
        
        // If they are not already in the same set, merge them
        // by making one root the parent of the other.
        if rootI != rootJ {
            parent[rootI] = rootJ
        }
    }
}

class Solution {
    func processQueries(_ c: Int, _ connections: [[Int]], _ queries: [[Int]]) -> [Int] {
        
        // 1. Build the connected components (power grids) using DSU
        var dsu = DSU(size: c)
        for conn in connections {
            dsu.union(conn[0], conn[1])
        }

        // 2. Group all stations by their component root
        //    componentNodes will map a root ID to a list of all stations in that grid.
        var componentNodes = [Int: [Int]]()
        for i in 1...c {
            let root = dsu.find(i)
            // Add station 'i' to the list for its corresponding root.
            componentNodes[root, default: []].append(i)
        }

        // 3. Sort the stations within each component by their ID (ascending)
        //    This allows us to quickly find the smallest ID.
        for root in componentNodes.keys {
            componentNodes[root]!.sort()
        }

        // 4. Initialize state trackers
        
        // Tracks which stations are currently offline
        var offlineStations = Set<Int>()
        
        // Stores the final results for Type 1 queries
        var results = [Int]()
        
        // This is the key optimization:
        // For each component (identified by its root), we store an index 'componentMinIndex[root]'.
        // This index points to the *next potential* smallest online station
        // in the sorted list 'componentNodes[root]'. We only ever move this index forward.
        var componentMinIndex = [Int: Int]()
        for root in componentNodes.keys {
            componentMinIndex[root] = 0
        }

        // 5. Process all queries
        for query in queries {
            let type = query[0]
            let station = query[1]

            if type == 2 {
                // --- Query Type 2: Take station offline ---
                offlineStations.insert(station)
                
            } else {
                // --- Query Type 1: Maintenance Check ---
                
                if !offlineStations.contains(station) {
                    // Case 1: The station is online. It resolves the check itself.
                    results.append(station)
                } else {
                    // Case 2: The station is offline.
                    // We must find the smallest-ID *online* station in its grid.
                    
                    // Find the root of the station's grid
                    let root = dsu.find(station)
                    
                    // Get the sorted list of all stations in this grid
                    guard let nodesInGrid = componentNodes[root] else {
                        // This case should be impossible if 1 <= station <= c
                        // (even an isolated node 'x' would be in componentNodes[x] = [x])
                        continue 
                    }
                    
                    // Get the current pointer for this grid. This is our starting point.
                    var currentIndex = componentMinIndex[root]!
                    var foundOnlineNode = -1

                    // Iterate forward from the last known position
                    while currentIndex < nodesInGrid.count {
                        let potentialNode = nodesInGrid[currentIndex]
                        
                        if !offlineStations.contains(potentialNode) {
                            // We found the smallest online node
                            foundOnlineNode = potentialNode
                            break // Stop searching
                        }
                        
                        // This node is also offline, so we'll check the next smallest
                        // one in the next iteration.
                        currentIndex += 1
                    }

                    // Add the result (either the node ID or -1 if none were found)
                    results.append(foundOnlineNode)
                    
                    // IMPORTANT: Save the new index.
                    // We will start our *next* search for this grid from this position.
                    // This amortizes the cost of the while loop to O(c) over all queries.
                    componentMinIndex[root] = currentIndex
                }
            }
        }

        return results
    }
}
