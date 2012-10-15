//
//  ViewCellToggle.m
//  Breathe
//
//  Created by Roger Reeder on 1/29/11.
//  Copyright 2011 National Center for Telehealth & Technology. All rights reserved.
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
#import "ViewCellSegment.h"


@implementation ViewCellSegment
@synthesize primaryLabel, secondaryLabel, segmentControl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
		primaryLabel = [[UILabel alloc]init];
		primaryLabel.textAlignment = UITextAlignmentLeft;
		primaryLabel.font = [UIFont systemFontOfSize:11];
		primaryLabel.backgroundColor = [UIColor clearColor];
		
		secondaryLabel = [[UILabel alloc]init];
		secondaryLabel.textAlignment = UITextAlignmentLeft;
		secondaryLabel.font = [UIFont systemFontOfSize:9];
		secondaryLabel.backgroundColor = [UIColor clearColor];

		if ([reuseIdentifier isEqualToString:@"VoiceType"]) {
			NSArray *itemArray = [NSArray arrayWithObjects: @"Female", @"Male", nil];
			segmentControl = [[UISegmentedControl alloc] initWithItems:itemArray];
		}
		if ([reuseIdentifier isEqualToString:@"Cycle"]) {
			NSArray *itemArray = [NSArray arrayWithObjects: @"8", @"10", @"12", @"14",@"16",nil];
			segmentControl = [[UISegmentedControl alloc] initWithItems:itemArray];
		}
		segmentControl.segmentedControlStyle = UISegmentedControlStylePlain; // UISegmentedControlStyleBordered ;
		segmentControl.selectedSegmentIndex = 0;

		[self.contentView addSubview:primaryLabel];
		[self.contentView addSubview:secondaryLabel];
		[self.contentView addSubview:segmentControl];
		
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	CGFloat padV,padH,padI,w,h,plh,slh,boundsX;
	CGRect contentRect = self.contentView.bounds;
	padH = 10.0f;
	padV = 5.0f;
	padI = 2.0f;
	w = contentRect.size.width;
	h = contentRect.size.height;
	plh = (h - (padV * 2.0f)) * 0.55f;
	slh = h - (padV * 2.0f) - plh;
	boundsX = contentRect.origin.x;
    CGRect plFrame = CGRectMake(boundsX+padH,h-plh-padV, w-(padH * 2.0f), plh);
    CGRect slFrame = CGRectMake(boundsX+padH, padV, w-(padH * 2.0f)-padI,slh);
    CGRect segFrame = CGRectMake(boundsX+padH,h-plh-padV, w-(padH * 2.0f), plh);
	secondaryLabel.font = [secondaryLabel.font fontWithSize:(slh)*0.8f];
	secondaryLabel.frame = slFrame;
	primaryLabel.font = [primaryLabel.font fontWithSize:(plh)*0.8f];
	primaryLabel.frame = plFrame;
	segmentControl.frame = segFrame;
}

- (void)dealloc {
    [super dealloc];
}


@end
