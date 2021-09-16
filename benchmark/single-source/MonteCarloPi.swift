//===--- MonteCarloPi.swift -----------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import TestsUtils

public let MonteCarloPi = BenchmarkInfo(
  name: "MonteCarloPi",
  runFunction: run_MonteCarloPi,
  tags: [.validation, .algorithm],
  legacyFactor: 125)

public func run_MonteCarloPi(scale: Int) {
  var pointsInside = 0
  let r = 10000
  let N = 4_000*scale
  for _ in 1...N {
    let x = Int(truncatingIfNeeded: Random())%r
    let y = Int(truncatingIfNeeded: Random())%r
    if x*x + y*y < r*r {
      pointsInside += 1
    }
  }
  let pi_estimate: Double = Double(pointsInside)*4.0/Double(N)
  let pi = 3.1415
  check(abs(pi_estimate - pi) < 0.2)
}
