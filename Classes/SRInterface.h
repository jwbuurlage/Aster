//
//  SRInterface.h
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
#import "SRInterfaceElement.h"
#import "SRTimeModule.h"
#import "SRLocation.h"
#import "SRLocationModule.h"
#import "SRSettingsModule.h"
#import "SRNamePlate.h"
#import "Texture2D.h"
#import "SRMessierInfo.h"
//#import "SterrenAppDelegate.h"

@class SRRenderer;
@class SRCamera;

@interface SRInterface : NSObject {
	SRRenderer* renderer;
	SRCamera* camera;
	id appDelegate;
	
	SRTimeModule* timeModule;
	SRLocationModule* locationModule;
	SRSettingsModule* settingsModule;
	
	SRNamePlate* theNameplate;
	SRMessierInfo* messierInfo;
	
	SRLocation* locationData;
		/* We moeten de data van SRLocation naar SRLocationModule krijgen, dit is de volgens mij de kortste route */
	
	NSMutableArray* UIElements;
	NSMutableArray* modules;

	NSString* clicker;
	
	GLuint textures[15];
	GLfloat textureCorners[300];
	GLfloat textureCoords[150];
	
	//klik support
	BOOL isClicking;
	CGRect rectClicked;
	
	BOOL stopShowingMessier;
	
	int xTranslate;
	int count;
	
	NSTimer *posiTimer;
	NSTimer *negiTimer;
	NSTimer *fadeTimer;
	UITextField *fieldTmp;
	
	NSString* currentlyEditingIdentifier;
	
	Texture2D* defaultTexture;
	BOOL defaultTextureBool;
	
	float alphaDefault;
	
	BOOL showingMessier;
	BOOL menuVisible;
}

@property (readonly) SRTimeModule* timeModule;
@property (readonly) SRRenderer* renderer;
@property (readonly) SRNamePlate* theNameplate;
@property (readonly) SRMessierInfo* messierInfo;
@property (nonatomic, assign) BOOL showingMessier;

-(id)initWithRenderer:(SRRenderer*)theRenderer;
-(void)loadNameplate;
-(void)loadTextureWithString:(NSString *)text intoLocation:(GLuint)location;
-(void)loadTexture:(NSString *)name intoLocation:(GLuint)location;
-(void)loadMenu;
-(void)loadModules;
-(void)renderInterface;
-(void)touchEndedAndExecute:(BOOL)result;
-(void)hideInterface;
-(void)showInterface;
-(void)hideAllModules;
-(void)translate:(NSTimer*)theTimer;
-(GLuint)textures;
-(BOOL)UIElementAtPoint:(CGPoint)point;
- (CGImageRef)CGImageRotatedByAngle:(CGImageRef)imgRef angle:(CGFloat)angle;
-(void)bringUpTheKeyboardWithText:(NSString *)placeholder onLocation:(int)location andSendResultsTo:(id)delegate;
-(void)fadeDefaultTexture;
-(void)drawRedOverlay;
-(void)fade:(NSTimer*)theTimer;

@end
