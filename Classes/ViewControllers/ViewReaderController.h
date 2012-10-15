//
//  viewReaderController.h
//  iBreathe
//
//  Created by Roger Reeder on 7/4/10.
//  Copyright 2010 National Center for Telehealth & Technology. All rights reserved.
//
/*
 *
 * Breathe2Relax
 *
 * Copyright © 2009-2012 United States Government as represented by
 * the Chief Information Officer of the National Center for Telehealth
 * and Technology. All Rights Reserved.
 *
 * Copyright © 2009-2012 Contributors. All Rights Reserved.
 *
 * THIS OPEN SOURCE AGREEMENT ("AGREEMENT") DEFINES THE RIGHTS OF USE,
 * REPRODUCTION, DISTRIBUTION, MODIFICATION AND REDISTRIBUTION OF CERTAIN
 * COMPUTER SOFTWARE ORIGINALLY RELEASED BY THE UNITED STATES GOVERNMENT
 * AS REPRESENTED BY THE GOVERNMENT AGENCY LISTED BELOW ("GOVERNMENT AGENCY").
 * THE UNITED STATES GOVERNMENT, AS REPRESENTED BY GOVERNMENT AGENCY, IS AN
 * INTENDED THIRD-PARTY BENEFICIARY OF ALL SUBSEQUENT DISTRIBUTIONS OR
 * REDISTRIBUTIONS OF THE SUBJECT SOFTWARE. ANYONE WHO USES, REPRODUCES,
 * DISTRIBUTES, MODIFIES OR REDISTRIBUTES THE SUBJECT SOFTWARE, AS DEFINED
 * HEREIN, OR ANY PART THEREOF, IS, BY THAT ACTION, ACCEPTING IN FULL THE
 * RESPONSIBILITIES AND OBLIGATIONS CONTAINED IN THIS AGREEMENT.
 *
 * Government Agency: The National Center for Telehealth and Technology
 * Government Agency Original Software Designation: Breathe2Relax001
 * Government Agency Original Software Title: Breathe2Relax
 * User Registration Requested. Please send email
 * with your contact information to: robert.kayl2@us.army.mil
 * Government Agency Point of Contact for Original Software: robert.kayl2@us.army.mil
 *
 */
#import <UIKit/UIKit.h>

@interface ViewReaderController : UIViewController <UIScrollViewDelegate, UIWebViewDelegate> {
	NSTimer *timer;
	NSTimeInterval timeInterval;
	int scrollCounter;
	CGFloat animationInterval;
	CGFloat pixelsPerFrame;
	BOOL bScroll;
	
	
	UIWebView *wvReader;
	UIScrollView *svReader;
	UIImageView *ivTopFader;
	UIImageView *ivBottomFader;

}
@property (nonatomic, retain) UIWebView *wvReader;
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic) CGFloat animationInterval;
@property (nonatomic) CGFloat pixelsPerFrame;

- (void)updateLayout:(CGRect)frame;
- (void)initDisplay;
- (void)loadHTML:(NSString *)fileName;

- (void)animationHasFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context;
- (void)fadeOutReader;
- (void)fadeInReader;
- (void)animShowView;

- (void)scroll:(NSTimer *)theTimer;
- (void)startScrolling;


@end
