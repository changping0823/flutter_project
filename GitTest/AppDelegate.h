//
//  AppDelegate.h
//  GitTest
//
//  Created by Charles on 2021/11/24.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;


@end

