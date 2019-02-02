//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()
// Review Management
let addReviewController = AddReviewController()
let approveReviewController = ApproveReviewController()
let removeReviewController = RemoveReviewController()
// User Management
let changeUserProfileController = ChangeUserProfileController()
let loginUserController = LoginUserController()
let logoutUserController = LogoutUserController()
let registerUserController = RegisterUserController()
var routes = Routes()

routes.add(method: .post, uri: "/addReview", handler: addReviewController.addReview)
routes.add(method: .post, uri: "/approveReview", handler: approveReviewController.approveReview)
routes.add(method: .post, uri: "/removeReview", handler: removeReviewController.removeReview)
routes.add(method: .post, uri: "/changeUserProfile", handler: changeUserProfileController.changeUserProfile)
routes.add(method: .post, uri: "/login", handler: loginUserController.loginUser)
routes.add(method: .post, uri: "/logout", handler: logoutUserController.logoutUser)
routes.add(method: .post, uri: "/register", handler: registerUserController.registerUser)

server.addRoutes(routes)
server.serverPort = 8080

do {
  try server.start()
} catch {
  fatalError("Network error - \(error)")
}
