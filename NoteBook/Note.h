//
//  Note.h
//  NoteBook
//
//  Created by Jon Friskics on 8/4/15.
//  Copyright (c) 2015 Code School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject <NSCoding>

@property (strong, nonatomic) NSString *noteText;

+ (BOOL)saveNotesToFile:(NSArray *)notes;
+ (NSArray *)readNotesFromFile;
+ (void)removeArchiveFile;

@end
