//
//  ELCAssetSelectionDelegate.h
//  Nosh Swift
//
//  Created by advatiya prasad on 4/11/16.
//  Copyright © 2016 advatiya prasad. All rights reserved.
//

#ifndef ELCAssetSelectionDelegate_h
#define ELCAssetSelectionDelegate_h


#endif /* ELCAssetSelectionDelegate_h */

#import <Foundation/Foundation.h>

@class ELCAsset;

@protocol ELCAssetSelectionDelegate <NSObject>

- (void)selectedAssets:(NSArray *)assets;
- (BOOL)shouldSelectAsset:(ELCAsset *)asset previousCount:(NSUInteger)previousCount;

@end