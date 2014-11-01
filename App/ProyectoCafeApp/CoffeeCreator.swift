//
//  CoffeeCreator.swift
//  ProyectoCafeAPp
//
//  Created by Rodolfo Castillo on 31/10/14.
//  Copyright (c) 2014 Rodolfo Castillo. All rights reserved.
//

import Foundation

class PostService {
    
    var settings:Settings!
    
    init(){
        self.settings = Settings()
    }
    
    func getPosts(callback:(NSDictionary)->()) {
        println("Get Coffee")
        request(settings.verCafe,callback)
    }
    
    func request(url:String,callback:(NSDictionary)->()) {
        var nsURL = NSURL(string: url)
        println(callback)
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsURL!) {
            (data,response,error) in
            var error:NSError?
            var response = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
            callback(response)
        }
        task.resume()
    }
}