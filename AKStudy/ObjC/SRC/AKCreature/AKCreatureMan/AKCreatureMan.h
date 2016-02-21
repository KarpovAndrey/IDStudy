//
//  AKCreatureMan.h
//  AKStudy
//
//  Created by Admin on 21.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreature.h"

@interface AKCreatureMan : AKCreature
@property(nonatomic, readonly) AKCreatureGender  gender;

-(void)goToWar;

@end