//
//  FactProvider.swift
//  FunFacts
//
//  Created by BoTingDing on 2018/2/25.
//  Copyright © 2018年 丁柏廷. All rights reserved.
//
import GameKit
struct FactProvider {
    let text = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus." ,
        "Contrary to popular belief, Lorem Ipsum is not simply random text." ,
        "Richard McClintock, a Latin professor at Hampden-Sydney College in " ,
        "looked up one of the more obscure Latin words, consectetur" ,
        "from a Lorem Ipsum passage, and going through the cites of the word" ,
        "This book is a treatise on the theory of ethics, very popular during the." ,
        "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.." ,
        "The standard chunk of Lorem Ipsum used since the 1500s is reproduced." ,
        "There are many variations of passages of Lorem Ipsum available." ,
        "but the majority have suffered alteration in some form"
    ]
    let facts = [
        "Ants stretch when they wake up in the morning",
        "Ostriches can run faster than horses",
        "Olympic gold medals are actually made mostly of silver",
        "You are born with 300 bones; by the time you are an adult you will have 206",
        "It takes about 8 minutes for the light from the Sun to reach Earth",
        "Some bamboo plants can grow almost a meter in just one day",
        "The state of Florida is bigger than England",
        "Some penguins can leap 2-3 meters out of the water",
        "On average, it takes 66 days to form a new habit",
        "Mammoths still walked the Earth when the Great Pyramid was being built"
    ]
    func randomFact() -> String {
        let random = GKRandomSource.sharedRandom().nextInt(upperBound: facts.count)
        
        return facts[random]
    }
    
    func randomText() -> String {
        let random = GKRandomSource.sharedRandom().nextInt(upperBound: text.count)
        
        return text[random]
    }
}
