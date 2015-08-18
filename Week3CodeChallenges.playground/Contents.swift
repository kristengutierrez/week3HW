//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//MONDAY//
//Write a function that takes in an array of numbers, and returns the lowest and highest numbers as a tuple

//var numberArray : [Int] = [3, 5, 6, 2, 8, 0, 1]
func returnNumbers(setOfNumbers: [Int]) -> (Int, Int) {
var sortedArray = sorted(setOfNumbers, <)
let first = sortedArray.first
let last = sortedArray.last
return (first!, last!)
}

var anotherNumberArray = [2, 5, 3, 8, 14, 67, 5]
returnNumbers(anotherNumberArray)

//TUESDAY//
//Given an array of ints of odd length, return a new array length 3 containing the elements from the middle of the array. The array length will be at least 3.





//WEDNESDAY//
//Given a non-negative number "num", return true if num is within 2 of a multiple of 10. Note: (a % b) is the remainder of dividing a by b, so (7 % 5) is 2





//THURSDAY//
//Given a string, return a string where for every char in the original, there are two chars. 

