//
//  ViewController.m
//  exif-objc
//
//  Created by Mac on 27/02/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ViewController.h"
#import "SYMetadata.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <PhotosUI/PhotosUI.h>

@interface ViewController () <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@end

@implementation ViewController
UIImagePickerController *picker;

- (void)viewDidLoad {
    [super viewDidLoad];

    picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
}

- (IBAction)onPressed:(id)sender {
    [self presentViewController:picker animated:YES completion:NULL];
}


- (void)isolatedFlow:(NSString *) path {
    NSURL *url = [NSURL fileURLWithPath:path];
    UIImage *img = [UIImage imageWithContentsOfFile: path];
    SYMetadata *metadata = [SYMetadata metadataWithFileURL:url];

    // Move it to Main Thread
    self.image.image = img;

    if (metadata == NULL) {
        return;
    }

    if (!metadata.metadataGPS)
        metadata.metadataGPS = [[SYMetadataGPS alloc] init];

    if (!metadata.metadataIPTC)
        metadata.metadataIPTC = [[SYMetadataIPTC alloc] init];

    metadata.metadataGPS.longitude = @-38.253;
    metadata.metadataGPS.latitude = @-3.180;

    metadata.metadataExif.dateTimeOriginal = @"2004:08:11 16:45:32";
    metadata.metadataExif.userComment = @"We can add the stringified version of the entry here";

    metadata.metadataIPTC.keywords  = @[@"Some test keywords", @"added by SYMetadata example app"];
    metadata.metadataIPTC.city      = @"New York";
    metadata.metadataIPTC.credit    = @"Aloc 2020";

    CGImageDestinationRef imageDestination = CGImageDestinationCreateWithURL((__bridge CFURLRef)url, kUTTypeJPEG, 1, NULL);

    if (imageDestination == NULL ) {
        NSLog(@"Error -> failed to create image destination.");
        return;
    }

    CGImageDestinationAddImage(imageDestination, img.CGImage, (__bridge CFDictionaryRef) metadata.generatedDictionary);

    if (CGImageDestinationFinalize(imageDestination) == NO) {
        NSLog(@"Error -> failed to finalize the image.");
    }

    CFRelease(imageDestination);

    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImageAtFileURL:url];
    } completionHandler: ^(BOOL success, NSError *error) {
        if (success){
            NSLog(@"Image Saved!");
        } else {
            NSLog(@"Error: %@", error);
        }
    }];
}

#pragma Picker Delegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [self dismissViewControllerAnimated:YES completion:NULL];

    NSURL *imageURL = (NSURL *)info[UIImagePickerControllerImageURL];
    NSString *path = imageURL.path;

    [self isolatedFlow:path];
}

@end

