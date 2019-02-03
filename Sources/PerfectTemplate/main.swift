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
server.serverPort = 8080

// Review Management

let addReviewController = AddReviewController()
let approveReviewController = ApproveReviewController()
let removeReviewController = RemoveReviewController()

// User Management

let changeUserProfileController = ChangeUserProfileController()
let loginUserController = LoginUserController()
let logoutUserController = LogoutUserController()
let registerUserController = RegisterUserController()

// Basket management

let addItemToBasket = AddItemToBasketController()
let removeItemFromBasket = RemoveItemFromBasketController()
let getItemsList = GetItemsListController()
let getUsersBasket = GetUsersBasketController()

var routes = Routes()

routes.add(method: .post, uri: "/addReview", handler: addReviewController.addReview)
routes.add(method: .post, uri: "/approveReview", handler: approveReviewController.approveReview)
routes.add(method: .post, uri: "/removeReview", handler: removeReviewController.removeReview)
routes.add(method: .post, uri: "/changeUserProfile", handler: changeUserProfileController.changeUserProfile)
routes.add(method: .post, uri: "/login", handler: loginUserController.loginUser)
routes.add(method: .post, uri: "/logout", handler: logoutUserController.logoutUser)
routes.add(method: .post, uri: "/register", handler: registerUserController.registerUser)
routes.add(method: .post, uri: "/addToBasket", handler: addItemToBasket.addItemToBasket)
routes.add(method: .post, uri: "/removeFromBasket", handler: removeItemFromBasket.removeItemFromBasket)
routes.add(method: .post, uri: "/getItemsList", handler: getItemsList.getItemsList)
routes.add(method: .post, uri: "/getUsersBasket", handler: getUsersBasket.getUsersBasket)

server.addRoutes(routes)

do {
  try server.start()
} catch {
  fatalError("Network error - \(error)")
}
