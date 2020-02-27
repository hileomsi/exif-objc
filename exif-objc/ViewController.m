//
//  ViewController.m
//  exif-objc
//
//  Created by Mac on 27/02/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ViewController.h"
#import "SYMetadata.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *image2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *img = [UIImage imageNamed: @"img1_with_exif.jpg"];
    NSData *data = UIImageJPEGRepresentation(img, 1);
    self.image.image = img;
    SYMetadata *metadata = [SYMetadata metadataWithImageData: data];
    
    NSLog(@"%@", metadata);
    NSLog(@"\n\n");
    
    if(!metadata.metadataGPS)
        metadata.metadataGPS = [[SYMetadataGPS alloc] init];
    
    if (!metadata.metadataIPTC)
        metadata.metadataIPTC = [[SYMetadataIPTC alloc] init];
    
    metadata.metadataGPS.longitude = @120.9090909090909090;
    metadata.metadataGPS.latitude = @-120.9090909090909090;
    
    metadata.metadataExif.dateTimeOriginal = @"2004:08:11 16:45:32";
    metadata.metadataExif.userComment = @"2Some test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywordsSome test keywords1";
    
    metadata.metadataIPTC.keywords  = @[@"Some test keywords", @"added by SYMetadata example app"];
    metadata.metadataIPTC.city      = @"Lyon";
    metadata.metadataIPTC.credit    = @"© Me 2017";
    metadata.metadataIPTC.referenceNumber = @[@"ALOC"];
    
    // create new image data with original image data and edited metadata
//    NSData *data = UIImageJPEGRepresentation(img, 1);
    NSData *dataWithMetadata = [SYMetadata dataWithImageData:data andMetadata:metadata];
    self.image2.image = [UIImage imageWithData: dataWithMetadata];
    
    // load metadata for newly cerated image
    SYMetadata *metadataNew = [SYMetadata metadataWithImageData:dataWithMetadata];
    
    
    
//    UIImageWriteToSavedPhotosAlbum([UIImage imageWithData: dataWithMetadata], NULL, NULL, NULL);
    
    
    NSLog(@"%@", metadataNew);
}


@end
