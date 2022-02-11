import UIKit

/*
 ___      _    _    _       ___          _
| _ )_  _| |__| |__| |___  / __| ___ _ _| |_
| _ \ || | '_ \ '_ \ / -_) \__ \/ _ \ '_|  _|
|___/\_,_|_.__/_.__/_\___| |___/\___/_|  \__|

 */




class BubbleSort {
    func sort(_ array: [Int]) -> [Int] {
        var arr = array
        let n = arr.count
        for i in 0..<n-1 {  // 변수 i 의 역할 : 배열 마지막에 고정된 숫자를 건들지 않기 위해 사용
            for j in 0..<n-i-1 {
                if arr[j] > arr[j+1] {
                    // swap
                    let temp = arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = temp
                }
            }
        }
        
        return arr
    }
}

let bubbleSort = BubbleSort()
bubbleSort.sort([5, 4, 3, 2, 1])






