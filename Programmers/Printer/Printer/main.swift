//
//  main.swift
//  Printer
//
//  Created by sapere4ude on 2020/12/21.
//

// [프로그래머스 프린터]
// 문제링크 : https://programmers.co.kr/learn/courses/30/lessons/42587

// priorityQueue 를 만들어줄 수 있는지가 이 문제의 핵심

import Foundation

// priorities: 문서의 중요도가 순서대로 담긴 배열
// location: 내가 인쇄를 요청한 문서가 현재 대기목록의 어떤 위치에 있는지를 알려줌
func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    //인덱스랑 우선 순위가 같이 저장되는 큐
    var queue: [(Int, Int)] = []
    //우선순위큐(우선순위 큐는 기본적으로 최대힙이므로 내림차순으로 정렬한다)
    var priorityQueue = priorities.sorted(by : >)
    //결과적으로 리턴해줘야하는 값
    var result = 0
    
    //우선순위를 순회하면서 큐에 인덱스와 함께 우선순위를 저장한다.
    priorities.enumerated().forEach { (index, property) in
        queue.append((index, property))
    }
    
    //큐가 비어있을 때까지 순회를 한다.
    while !queue.isEmpty {
        
        // 큐의 맨 앞에 있는 우선순위와 우선순위큐의 첫번째 값을 비교한다.
        if queue.first!.1 == priorityQueue.first! {
            
            //큐의 맨앞에 있는 값의 인덱스가 내가 요청한 문서의 인덱스인지 확인한다.
            if queue.first!.0  == location {
                return result + 1
            }
            //우선순위의 값과 일치하므로 우선순위 큐에서 하나를 pop한다.
            result += 1
            queue.removeFirst()
            priorityQueue.removeFirst()
        } else {
            // 더 높은 우선순위의 값이 존재하므로 하나를 꺼내 맨 뒤에 push 한다.
            queue.append(queue.removeFirst())
        }
    }
    
    return result
}

//print(solution([2,1,3,2], 2))
solution([1,1,9,1,1,1], 0)
