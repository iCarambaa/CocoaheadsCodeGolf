//
//  HeatWaves.swift
//  HeatWaves
//
//  Created by Sven Titgemeyer on 20.05.18.
//  Copyright © 2018 Cocoaheads Aachen. All rights reserved.
//  Solution by Roland Schmitz
//

// Background
//
// The Royal Netherlands Meteorological Institute defines a heat wave* as a
// series of at least 5 consecutive days of ≥25°C weather (“summery weather”),
// such that at least 3 of those days are ≥30°C (“tropical weather”).
//
// The tropical weather doesn't have to be measured consecutively: for example:
// 30, 25, 30, 26, 27, 28, 32, 30 is a 8-day long heat wave with 4 days of
// tropical weather.
//
// *(Well, by Dutch standards.)
//
// Challenge
//
// Given a non-empty list of positive integers representing Celsius temperature
// measurements from successive days, decide whether that list contains a heat
// wave (as per the above definition).
//
// The shortest answer in bytes wins.
//
// How does the 65 byte solution work?
//
// - The reduce starts with 1 and is multiplied with 2 for numbers >= 25 and
//   multiplied with 2 and 3 (=6) for numbers >= 30.
// - The reduce falls back to 1 if a number is smaller than 25.
// - If the reduce is once divisible by 864 which is 2*2*2*2*2 * 3*3*3 it does
//   not change its value any more and true is returned.
// - 864 (2*2*2*2*2 * 3*3*3) can be interpreted as:
//   - 2*2*2*2*2: contains a sequence with 5 numbers >= 25 and
//   - 3*3*3: at least 3 of them are >= 30.

public func isHeatWaveIncludedIn(waves w: [Int]) -> Bool {
    return w.reduce(1,{$0%864>0 ?$1<25 ?1:$0*($1<30 ?2:6):$0})%864<1
}
