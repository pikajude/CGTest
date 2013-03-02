//
//  CGTAppDelegate.h
//  CGTest
//
//  Created by Joel on 3/2/13.
//  Copyright (c) 2013 Joel. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CGTAppDelegate : NSObject <NSApplicationDelegate> {
    CFRunLoopSourceRef ref;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSButton *button;

- (IBAction)foo:(id)sender;
- (void)setButtonValue:(NSString *)value;

@end
