//
//  IMGManager.m
//  LuMW
//
//  Created by 何仕德 on 17/7/28.
//  Copyright © 2017年 hstar. All rights reserved.
//

#import "IMGManager.h"
#import <UIKit/UIKit.h>

void STImageWriteToPhotosAlbum(UIImage *image, NSString *album, IMGManagerHandler completionHandler) {
    [[IMGManager sharedManager] saveImage:image toAlbum:album completionHandler:completionHandler];
}

@interface IMGManager ()

@property(nonatomic, strong) ALAssetsLibrary *assetsLibrary;

@end

@implementation IMGManager

static IMGManager *_sharedManager;
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ _sharedManager = [[self alloc] init]; });
    return _sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (ALAssetsLibrary *)assetsLibrary {
    if (!_assetsLibrary) {
        _assetsLibrary = [[ALAssetsLibrary alloc] init];
    }
    return _assetsLibrary;
}

- (void)saveImage:(UIImage *)image toAlbum:(NSString *)album completionHandler:(IMGManagerHandler)completionHandler {
    [self.assetsLibrary writeImage:image
                           toAlbum:album
                 completionHandler:^(UIImage *image, NSError *error) {
                     if (completionHandler) {
                         completionHandler(image, error);
                     }
                     /// 注意，这里每次都置空是因为期间如果操作相册了，下次保存之前希望能取到最新状态。
                     self.assetsLibrary = nil;
                 }];
}
@end




@implementation ALAssetsLibrary (IMGManagerLibrary)

- (void)writeImage:(UIImage *)image toAlbum:(NSString *)album completionHandler:(IMGManagerHandler)completionHandler {
    [self writeImageToSavedPhotosAlbum:image.CGImage
                           orientation:(ALAssetOrientation)image.imageOrientation
                       completionBlock:^(NSURL *assetURL, NSError *error) {
                           if (error) {
                               if (completionHandler) {
                                   completionHandler(image, error);
                               }
                           } else {
                               [self addAssetURL:assetURL
                                         toAlbum:album
                               completionHandler:^(NSError *error) {
                                   if (completionHandler) {
                                       completionHandler(image, error);
                                   }
                               }];
                           }
                       }];
}

- (void)addAssetURL:(NSURL *)assetURL toAlbum:(NSString *)album completionHandler:(ALAssetsLibraryAccessFailureBlock)completionHandler {
    void (^assetForURLBlock)(NSURL *, ALAssetsGroup *) = ^(NSURL *URL, ALAssetsGroup *group) {
        [self assetForURL:assetURL
              resultBlock:^(ALAsset *asset) {
                  [group addAsset:asset];
                  completionHandler(nil);
              }
             failureBlock:^(NSError *error) { completionHandler(error); }];
    };
    __block ALAssetsGroup *group;
    [self enumerateGroupsWithTypes:ALAssetsGroupAlbum
                        usingBlock:^(ALAssetsGroup *_group, BOOL *stop) {
                            if ([album isEqualToString:[_group valueForProperty:ALAssetsGroupPropertyName]]) {
                                group = _group;
                            }
                            if (!_group) {
                                /// 循环结束
                                if (group) {
                                    assetForURLBlock(assetURL, group);
                                } else {
                                    [self addAssetsGroupAlbumWithName:album
                                                          resultBlock:^(ALAssetsGroup *group) { assetForURLBlock(assetURL, group); }
                                                         failureBlock:completionHandler];
                                }
                            }
                        }
                      failureBlock:completionHandler];
}
@end
