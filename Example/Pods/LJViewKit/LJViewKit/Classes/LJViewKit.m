//
//  [view startAdapt]; LJViewKit.m
//  PP
//
//  Created by 李健 on 2018/7/31.
//  Copyright © 2018年 李健. All rights reserved.
//
#import "LJViewKit.h"
#import "UIView+LJView.h"
#import "LJViewMethodExchangeUtil.h"
#import "UIView+LJKVCView.h"
#import "NSObject+CustomerDealloc.h"
#import "LJViewFrameChangeNoRepeatModel.h"

viewFrameChangeBlock getNoRepeatBlock(viewFrameChangeBlock block)
{
    LJViewFrameChangeNoRepeatModel *model = [[LJViewFrameChangeNoRepeatModel alloc]init];

    return ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
               if (CGRectEqualToRect(oldFrame, newFrame)) {} else {
                   if ([model.NewFrameValue isKindOfClass:NSValue.class] && [model.oldFrameValue isKindOfClass:NSValue.class]) {
                       CGRect   aheadoldFrame = [model.oldFrameValue CGRectValue];
                       CGRect   aheadnewFrame = [model.NewFrameValue CGRectValue];

                       if (CGRectEqualToRect(aheadnewFrame, newFrame) && CGRectEqualToRect(aheadoldFrame, oldFrame)) {
                           return;
                       }
                   }

                   model.NewFrameValue = [NSValue valueWithCGRect:newFrame];
                   model.oldFrameValue = [NSValue valueWithCGRect:oldFrame];

                   if (block) {
                       block(view, oldFrame, newFrame);
                   }
               }
    };
}

viewSuperFrameChangeBlock getSuperNoRepeatBlock(viewSuperFrameChangeBlock block)
{
    LJViewFrameChangeNoRepeatModel *model = [[LJViewFrameChangeNoRepeatModel alloc]init];

    return ^(UIView *view, UIView *superView, CGRect oldFrame, CGRect newFrame) {
               if (CGRectEqualToRect(oldFrame, newFrame)) {} else {
                   if ([model.NewFrameValue isKindOfClass:NSValue.class] && [model.oldFrameValue isKindOfClass:NSValue.class]) {
                       CGRect   aheadoldFrame = [model.oldFrameValue CGRectValue];
                       CGRect   aheadnewFrame = [model.NewFrameValue CGRectValue];

                       if (CGRectEqualToRect(aheadnewFrame, newFrame) && CGRectEqualToRect(aheadoldFrame, oldFrame)) {
                           return;
                       }
                   }

                   model.NewFrameValue = [NSValue valueWithCGRect:newFrame];
                   model.oldFrameValue = [NSValue valueWithCGRect:oldFrame];

                   if (block) {
                       block(view, superView, oldFrame, newFrame);
                   }
               }
    };
}

void viewSetFrameChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class]) {
        [LJViewMethodExchangeUtil methodlayoutSubviewsChangeBlock_MethodExchange];
        [view setFrameChangeBlock_kvcView:getNoRepeatBlock(block)];
    }
}

void viewAddFrameChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodlayoutSubviewsChangeBlock_MethodExchange];
        [view addFrameChangeBlock_kvcView:getNoRepeatBlock(block)];
    }
}

void objectAddObjectDeallocBlock(NSObject *object, objectDeallocBlock block)
{
    if ([object isKindOfClass:NSObject.class] && block) {
        [NSObject registerCustomerDeallocArrayObject:object block:block Key:@"LJViewKit"];
    }
}

void SetFrameDidChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetFrameDidChangeBlock:getNoRepeatBlock(block)];
    }
}

void AddFrameDidChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddFrameDidChangeBlock:getNoRepeatBlock(block)];
    }
}

void AddFrameDidChangeKeyBlock(UIView *view, NSString *key, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddFrameDidChangeKeyBlock:getNoRepeatBlock(block) AndKey:key];
    }
}

void SetWindowWillMoveBlock(UIView *view, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetWindowWillMoveBlock:block];
    }
}

void AddWindowWillMoveBlock(UIView *view, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddWindowWillMoveBlock:block];
    }
}

void SetWindowDidMoveBlock(UIView *view, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetWindowDidMoveBlock:block];
    }
}

void AddWindowDidMoveBlock(UIView *view, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddWindowDidMoveBlock:block];
    }
}

void SetWindowWillAddBlock(UIView *view, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetWindowWillAddBlock:block];
    }
}

void AddWindowWillAddBlock(UIView *view, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddWindowWillAddBlock:block];
    }
}

void SetWindowDidAddBlock(UIView *view, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetWindowDidAddBlock:block];
    }
}

void AddWindowDidAddBlock(UIView *view, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddWindowDidAddBlock:block];
    }
}

void AddWindowDidAddKeyBlock(UIView *view, NSString *key, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddWindowDidAddKeyBlock:block AndKey:key];
    }
}

void AddWindowDidMoveKeyBlock(UIView *view, NSString *key, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddWindowDidMoveKeyBlock:block AndKey:key];
    }
}

void AddWindowWillAddKeyBlock(UIView *view, NSString *key, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddWindowWillAddKeyBlock:block AndKey:key];
    }
}

void AddWindowWillMoveKeyBlock(UIView *view, NSString *key, viewWindowChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddWindowWillMoveKeyBlock:block AndKey:key];
    }
}

void SetSuperViewFrameDidChangeBlock(UIView *view, viewSuperFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetSuperViewFrameDidChangeBlock:getSuperNoRepeatBlock(block)];
    }
}

void AddSuperViewFrameDidChangeBlock(UIView *view, viewSuperFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddSuperViewFrameDidChangeBlock:getSuperNoRepeatBlock(block)];
    }
}

void AddSuperViewFrameDidChangeKeyBlock(UIView *view, NSString *key, viewSuperFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddSuperViewFrameDidChangeKeyBlock:getSuperNoRepeatBlock(block) AndKey:key];
    }
}

void SetViewWillAddSubViewBlock(UIView *view, viewBeAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetViewWillAddSubViewBlock:block];
    }
}

void AddViewWillAddSubViewBlock(UIView *view, viewBeAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewWillAddSubViewBlock:block];
    }
}

void AddViewWillAddSubViewKeyBlock(UIView *view, NSString *key, viewBeAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewWillAddSubViewKeyBlock:block AndKey:key];
    }
}

void SetViewDidAddSubViewBlock(UIView *view, viewBeAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetViewDidAddSubViewBlock:block];
    }
}

void AddViewDidAddSubViewBlock(UIView *view, viewBeAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewDidAddSubViewBlock:block];
    }
}

void AddViewDidAddSubViewKeyBlock(UIView *view, NSString *key, viewBeAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewDidAddSubViewKeyBlock:block AndKey:key];
    }
}

void SetViewWillRemoveBlock(UIView *view, viewRemoveView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetViewWillRemoveBlock:block];
    }
}

void AddViewWillRemoveBlock(UIView *view, viewRemoveView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewWillRemoveBlock:block];
    }
}

void AddViewWillRemoveKeyBlock(UIView *view, NSString *key, viewRemoveView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewWillRemoveKeyBlock:block AndKey:key];
    }
}

void SetViewDidRemoveBlock(UIView *view, viewRemoveView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetViewDidRemoveBlock:block];
    }
}

void AddViewDidRemoveBlock(UIView *view, viewRemoveView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewDidRemoveBlock:block];
    }
}

void AddViewDidRemoveKeyBlock(UIView *view, NSString *key, viewRemoveView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodMoveChangeBlock_MethodExchange:view.class];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewDidRemoveKeyBlock:block AndKey:key];
    }
}

void SetViewAddSubViewBlock(UIView *view, viewAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetViewAddSubViewBlock:block];
    }
}

void AddViewAddSubViewBlock(UIView *view, viewAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewAddSubViewBlock:block];
    }
}

void AddViewAddSubViewKeyBlock(UIView *view, NSString *key, viewAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewAddSubViewKeyBlock:block AndKey:key];
    }
}
