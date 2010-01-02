//
//  SRPlanetInfo.m
//  Sterren
//
//  Created by Thijs Scheepers on 27-12-09.
//  Copyright 2009 Web6.nl Diensten. All rights reserved.
//

#import "SRStarInfo.h"


@implementation SRStarInfo

-(id)init {
	if(self = [super init]) {
		elements = [[NSMutableArray alloc] init];
		
		[elements addObject:[[SRInterfaceElement alloc] initWithBounds:CGRectMake(38, 222, 128, 32) 
															   texture:[[Texture2D alloc] initWithString:@"Ster Informatie" dimensions:CGSizeMake(128,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:12] 
															identifier:@"text" 
															 clickable:NO]];
		
		[elements addObject:[[SRInterfaceElement alloc] initWithBounds:CGRectMake(38, 195, 128, 32) 
															   texture:[[Texture2D alloc] initWithString:@"Sterrenbeeld:" dimensions:CGSizeMake(128,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:11] 
															identifier:@"text-transparent" 
															 clickable:NO]];
		
		[elements addObject:[[SRInterfaceElement alloc] initWithBounds:CGRectMake(38, 180, 128, 32) 
															   texture:[[Texture2D alloc] initWithString:@"RA:" dimensions:CGSizeMake(128,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:11] 
															identifier:@"text-transparent" 
															 clickable:NO]];
		
		[elements addObject:[[SRInterfaceElement alloc] initWithBounds:CGRectMake(38, 165, 64, 32) 
															   texture:[[Texture2D alloc] initWithString:@"Declinatie:" dimensions:CGSizeMake(64,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:11] 
															identifier:@"text-transparent" 
															 clickable:NO]];
		
		[elements addObject:[[SRInterfaceElement alloc] initWithBounds:CGRectMake(38, 150, 64, 32) 
															   texture:[[Texture2D alloc] initWithString:@"Magnitude:" dimensions:CGSizeMake(64,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:11] 
															identifier:@"text-transparent" 
															 clickable:NO]];
		
		[elements addObject:[[SRInterfaceElement alloc] initWithBounds:CGRectMake(110, 195, 128, 32) 
															   texture:[[Texture2D alloc] initWithString:@"UMa" dimensions:CGSizeMake(128,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:11] 
															identifier:@"text-blue" 
															 clickable:NO]];
		
		
		[elements addObject:[[SRInterfaceElement alloc] initWithBounds:CGRectMake(60, 180, 128, 32) 
															   texture:[[Texture2D alloc] initWithString:@"12 52' 12''" dimensions:CGSizeMake(128,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:11] 
															identifier:@"text-blue" 
															 clickable:NO]];
		
		[elements addObject:[[SRInterfaceElement alloc] initWithBounds:CGRectMake(95, 165, 64, 32) 
															   texture:[[Texture2D alloc] initWithString:@"90" dimensions:CGSizeMake(64,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:11] 
															identifier:@"text-blue" 
															 clickable:NO]];
		
		[elements addObject:[[SRInterfaceElement alloc] initWithBounds:CGRectMake(98, 150, 64, 32) 
															   texture:[[Texture2D alloc] initWithString:@"12.0" dimensions:CGSizeMake(64,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:11] 
															identifier:@"text-green" 
															 clickable:NO]]; 
		interfaceBackground = [[Texture2D alloc] initWithImage:[UIImage imageNamed:@"starInfoBg.png"]];
		
	}
	return self;
}

@synthesize hiding, alphaValue, alphaValueName;

/* + (SRMessierInfo*)shared {
 if(!sharedMessier) {
 sharedMessier = [[SRMessierInfo alloc] init];
 }
 return sharedMessier;
 } */

-(void)show {
	alphaValue = 0.0f;
	alphaValueName = -1.0f;
	hiding = FALSE;
}

-(void)hide {
	hiding = TRUE;
}

- (void)starClicked:(SRStar*)theStar {
	//[messierImage release];
	//messierImage = ;
	//NSLog(@"%@", [NSString stringWithFormat:@"%@.png", [theStar name]]);
	[[elements objectAtIndex:[elements count] - 1] setTexture:[[Texture2D alloc] initWithString:theStar.name dimensions:CGSizeMake(64,32) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:12]]; 
	[[elements objectAtIndex:[elements count] - 1] setBounds:CGRectMake(311 - [theStar.name sizeWithFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]].width / 2, 18,64,32)];
}

- (void)draw {	
	glTranslatef(245,-15,0);
	glColor4f(1.0f, 1.0f, 1.0f, alphaValue);
	[interfaceBackground drawInRect:CGRectMake(20, 0, 200, 320)];
	for (SRInterfaceElement* mElement in elements) {
		if([mElement identifier] == @"text-transparent") {
			glColor4f(0.4f, 0.4f, 0.4f, alphaValue);
			[[mElement texture] drawInRect:[mElement bounds]];
 		}
		else if([mElement identifier] == @"text-blue") {
			glColor4f(0.294f, 0.513f, 0.93f, alphaValue);
			[[mElement texture] drawInRect:[mElement bounds]];
		}
		else if([mElement identifier] == @"text-green") {
			glColor4f(0.56f, 0.831f, 0.0f, alphaValue);
			[[mElement texture] drawInRect:[mElement bounds]];
		}
		else {
			glColor4f(1.0f, 1.0f, 1.0f, alphaValue);
			[[mElement texture] drawInRect:[mElement bounds]];
		}
	}
	
	glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
	glTranslatef(-245,15,0);
}


@end