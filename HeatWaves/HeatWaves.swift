//
//  HeatWaves.swift
//  HeatWaves
//
//  Created by Sven Titgemeyer on 20.05.18.
//  Copyright © 2018 Cocoaheads Aachen. All rights reserved.
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
public var isHeatWaveIncludedIn:([Int])->Bool = {
    $0.reduce(1){$0>0&&$1<25 ?1:$0*($1<30 ?2:3)%108}<1
}
