//
//  CYTest.m
//  CYPlayer
//
//  Created by 黄威 on 2018/8/16.
//  Copyright © 2018年 Sutan. All rights reserved.
//

#import "CYTest.h"
#import <CYFFmpeg/CYFFmpeg.h>
//#import "x264.h"


@implementation CYTest

static void my_smbc_get_auth_data_with_context_fn(SMBCCTX *c,
                                                  const char *srv,
                                                  const char *shr,
                                                  char *workgroup, int wglen,
                                                  char *username, int unlen,
                                                  char *password, int pwlen)
{
    
    if (username) {
           {
               strncpy(username, "guest", unlen - 1);
           }
       }
    
       if (password) {
           {
               password[0] = 0;
           }
       }
    
       if (workgroup) {
           {
               workgroup[0] = 0;
           }
       }
}



+ (void)test
{
    SMBCCTX * ctx = smbc_new_context();
    if (!ctx) {
        NSLog(@"smbc_new_context failed");
    }
    
    if (!smbc_init_context(ctx))
    {
        NSLog(@"smbc_init_context failed");
    }
    smbc_set_context(ctx);
    
    smbc_setFunctionAuthDataWithContext(ctx, my_smbc_get_auth_data_with_context_fn);
    //    smbc_setOptionUserData(ctx, h);
    //    smbc_setFunctionAuthDataWithContext(libsmbc->ctx, libsmbc_get_auth_data);
    
    
    if (smbc_init(NULL, 0) < 0) {
        NSLog(@"smbc_init failed");
    }
    
    //    smbc_get_auth_data_fn fn;
    //    int debug;
    //    smbc_init(fn, debug);
    
    
    if ((smbc_open("smb://guest@172.16.9.10/video/test.mp4", O_RDONLY | O_WRONLY, 0666)) < 0) {
        NSLog(@"File open failed");
    }
    //
    //    x264_encoder_encode(NULL, NULL, NULL, NULL, NULL);
    
    //    avcodec_open2(NULL, NULL, NULL);
}

@end
