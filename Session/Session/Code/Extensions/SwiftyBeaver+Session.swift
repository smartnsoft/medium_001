//
//  SwiftyBeaver+NewsDeck.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import SwiftyBeaver

extension SwiftyBeaver {

  class func configure() {
    let console = ConsoleDestination()
    console.levelColor.verbose = "⚪️ "
    console.levelColor.debug = "☑️ "
    console.levelColor.info = "🔵 "
    console.levelColor.warning = "🔶 "
    console.levelColor.error = "🔴 "
    #if DEBUG
      console.minLevel = .verbose
    #else
      console.minLevel = .error
    #endif

    log.addDestination(console)
  }
}
