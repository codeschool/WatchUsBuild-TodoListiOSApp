//
//  AddNoteViewController.h
//  NoteBook
//
//  Created by Jon Friskics on 8/4/15.
//  Copyright (c) 2015 Code School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Note;

@protocol AddNoteViewControllerDelegate <NSObject>

- (void)saveNote:(Note *)note;

@end

@interface AddNoteViewController : UIViewController

@property (weak, nonatomic) id<AddNoteViewControllerDelegate> delegate;

@end
