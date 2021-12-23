/*
  StringStuff.swift
  
  By Zefeng Wang
  Created on December 15, 2021
  
  This program reads a string and returns the length of the longest
  sequence of successive numbers/characters within the string. 
*/

// Import the Foundation module 
import Foundation

func maxRun(str: String) -> String {
	var maxCount = 0
	var count = 1
	let array = Array(str)

	// Finds and returns the longest run in the string
	for index in 0..<array.count - 1 {
		if array[index] == array[index + 1] {
			count += 1
		} else {
			count = 1
		}

		if count > maxCount {
			maxCount = count
		}
	}
	return String(maxCount) + "\n"

}

// Read the contents of the input.txt file
let text = try String(contentsOfFile: "input.txt")
let strArr = text.components(separatedBy: "\n").filter { $0 != "" }

// Process and write the contents to the output.txt file
var string = ""
for index in 0..<strArr.count {
	string += maxRun(str: strArr[index])
}
try string.write(toFile: "output.txt", atomically: false,
                        encoding: String.Encoding.utf8)
