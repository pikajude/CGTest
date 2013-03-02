//
//  CGTAppDelegate.m
//  CGTest
//
//  Created by Joel on 3/2/13.
//  Copyright (c) 2013 Joel. All rights reserved.
//

#import "CGTAppDelegate.h"

CGEventRef callback(CGEventTapProxy proxy, CGEventType type, CGEventRef event, void *refcon) {
    [(CGTAppDelegate *)refcon setButtonValue:@"hello"];
    return NULL;
}

@implementation CGTAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[self window] setLevel:NSFloatingWindowLevel];
}

- (IBAction)foo:(id)sender
{
    CFMachPortRef tap = CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap, kCGEventTapOptionDefault, CGEventMaskBit(kCGEventKeyDown), &callback, self);
    ref = CFMachPortCreateRunLoopSource(NULL, tap, 0);
    CFRunLoopAddSource(CFRunLoopGetMain(), ref, kCFRunLoopDefaultMode);
}

- (void)setButtonValue:(NSString *)value
{
    [[self button] setTitle:value];
    CFRunLoopSourceInvalidate(ref);
    CFRelease(ref);
}

@end
