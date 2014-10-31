//
//  City.h
//  CodeChallenge2
//
//  Created by Jonathan Chou on 10/30/14.
//  Copyright (c) 2014 Jonathan Chou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol CityDelegate <NSObject>

- (void)returnURLOfCityDescription;

@end

@interface City : NSObject


@property id <CityDelegate> delegate;
@property NSString *name;
@property NSString *state;
@property NSString *urlOfWiki;
@property UIImage *image;
- (void) urlButtonPressed;

@end
