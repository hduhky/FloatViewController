//
//  UVContainerScrollDelegate.m
//  MapLike
//
//  Created by smb-lsp on 2020/9/16.
//  Copyright © 2020 SMB-APP. All rights reserved.
//

#import "UVContainerScrollDelegate.h"
#import "UVContainerScrollView.h"

@implementation UVContainerScrollDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableView didSelectRowAtIndexPath: %@", @(indexPath.row));
    [((UVContainerScrollView *)self.containerView) scrollView:tableView didSelectItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"collectionView didSelectItemAtIndexPath: %@", @(indexPath.row));
    [((UVContainerScrollView *)self.containerView) scrollView:collectionView didSelectItemAtIndexPath:indexPath];
}

@end
