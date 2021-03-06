//
//  SRTimeManager.h
//
//  A part of Sterren.app, planetarium iPhone application.
//  Created by: Jan-Willem Buurlage and Thijs Scheepers
//  Copyright 2006-2009 Mote of Life. All rights reserved.
//
//  Use without premission by Mote of Life is not authorised.
//
//  Mote of Life is a registred company at the Dutch Chamber of Commerce.
//  Chamber of Commerce registration number: 37126951
//

#import <Foundation/Foundation.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@class SRTimeModule;

@interface SRTimeManager : NSObject {
	NSDate* simulatedDate;
		
	int totalInterval;
	int speed;
	int speedPause;
	float elapsed;
	
	SRTimeModule* moduleInstance;
	
	NSCalendar* gregorian;
	
	BOOL playing;
}

@property (readonly) NSDate* simulatedDate;
@property (assign) int totalInterval;
@property (assign) int speed;
@property (assign) SRTimeModule *moduleInstance;
@property (readonly) float elapsed;
@property (readonly) BOOL playing;

-(id)init;
-(NSString*)theTime;
-(NSString*)theDate;
-(int)speed;
-(void)tickOfTime:(NSTimeInterval)timeElapsed;
-(void)fwd;
-(void)rew;
-(void)reset;
-(void)playPause;
-(BOOL)isGoingFast;

@end
