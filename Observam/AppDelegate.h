//
//  AppDelegate.h
//  Observam
//
//  Created by Mathieu Godart on 11/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppD : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) BOOL drugAlreadyTaken;

+ (AppD *)me;

+ (UIColor *)globalTintColor;

@end


