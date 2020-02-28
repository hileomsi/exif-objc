//
//  ViewController.m
//  exif-objc
//
//  Created by Mac on 27/02/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ViewController.h"
#import "SYMetadata.h"

@interface ViewController () <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *image2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)isolatedFlow:(UIImage *) img {
//    UIImage *img = [UIImage imageNamed: @"img1_with_exif.jpg"];
    NSData *data = UIImageJPEGRepresentation(img, 1);
    self.image.image = img;
    SYMetadata *metadata = [SYMetadata metadataWithImageData: data];

    NSLog(@"%@", metadata);
    NSLog(@"\n\n");

    if(!metadata.metadataGPS)
        metadata.metadataGPS = [[SYMetadataGPS alloc] init];

    if (!metadata.metadataIPTC)
        metadata.metadataIPTC = [[SYMetadataIPTC alloc] init];

    metadata.metadataGPS.longitude = @0.0;
    metadata.metadataGPS.latitude = @0.0;

    metadata.metadataExif.dateTimeOriginal = @"2004:08:11 16:45:32";
    metadata.metadataExif.userComment = @"We can add the stringified version of the entry here";

    metadata.metadataIPTC.keywords  = @[@"Some test keywords", @"added by SYMetadata example app"];
    metadata.metadataIPTC.city      = @"New York";
    metadata.metadataIPTC.credit    = @"Aloc 2020";

    // create new image data with original image data and edited metadata
//    NSData *data = UIImageJPEGRepresentation(img, 1);
    NSData *dataWithMetadata = [SYMetadata dataWithImageData:data andMetadata:metadata];
    UIImage *newImage = [UIImage imageWithData: dataWithMetadata];
    self.image2.image = newImage;

    // load metadata for newly cerated image
    SYMetadata *metadataNew = [SYMetadata metadataWithImageData: dataWithMetadata];

    UIImageWriteToSavedPhotosAlbum(newImage, NULL, NULL, NULL);

    NSLog(@"%@", metadataNew);
}

#pragma Picker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [self dismissViewControllerAnimated:YES completion:NULL];

    UIImage *image = (UIImage *)info[UIImagePickerControllerOriginalImage];
    [self isolatedFlow:image];
}

@end
