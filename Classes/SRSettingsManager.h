//
//  SRSettingsManager.h
//  Sterren
//
//  Created by Thijs Scheepers on 06-12-09.
//  Copyright 2009 Web6.nl Diensten. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SRSettingsManager : NSObject {
	double brightnessFactor;
	BOOL showConstellations;
	BOOL showRedOverlay;

	BOOL showPlanetLabels;
	BOOL showPositionOverlay;
}

@property (nonatomic,readwrite) double brightnessFactor;
@property (nonatomic,readwrite) BOOL showConstellations;
@property (nonatomic,readwrite) BOOL showPlanetLabels;

@property (nonatomic,readwrite) BOOL showPositionOverlay;
@property (nonatomic,readwrite) BOOL showRedOverlay;

@end
