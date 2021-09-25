//
//  main.swift
//  SecretSantaSwiftCli
//
//  Created by mbb on 24.09.21.
//

import Foundation

var participants = ["Michael", "Alice", "Bob", "Charlie", "Diane"];

func getOffset(senders: Array<String>)  -> Int
{
	var numParticipants = senders.capacity
	return Int.random(in: 0..<numParticipants)
}

func getReceiverIndex(senderIndex: Int, numParticipants: Int, offset: Int) -> Int{
	var relativeIndex = senderIndex + offset;
	var adjustedIndex = relativeIndex % numParticipants;
	
	return adjustedIndex
}
func getPairings(senders: Array<String>) -> [(sender: String, receiver: String)]
{
	var pairings: [(sender: String, receiver: String)] = []
	var offset = getOffset(senders: participants)
	for (index, element) in participants.enumerated() {
		pairings.append((sender:element, receiver:participants[getReceiverIndex(senderIndex: index, numParticipants: participants.capacity, offset: offset)]))
	}
	
	return pairings;
}

print(getPairings(senders: participants))
