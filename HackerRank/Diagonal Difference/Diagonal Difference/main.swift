//
//  main.swift
//  Diagonal Difference
//
//  Created by Kant on 2022/02/12.
//

import Foundation

/*
 * Complete the 'diagonalDifference' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY arr as parameter.
 */

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    let rightDiagonal = arr[0][0] + arr[1][1] + arr[2][2]
    let leftDiagonal = arr[0][2] + arr[1][1] + arr[2][0]
    
    return abs(rightDiagonal - leftDiagonal)
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var arr = [[Int]]()

for _ in 1...n {
    guard let arrRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arrRow: [Int] = arrRowTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == n else { fatalError("Bad input") }

    arr.append(arrRow)
}

guard arr.count == n else { fatalError("Bad input") }

let result = diagonalDifference(arr: arr)

//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
