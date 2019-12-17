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

void viewSetFrameChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class]) {
        [view setFrameChangeBlock_kvcView:block];
    }
}

void viewAddFrameChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [view addFrameChangeBlock_kvcView:block];
    }
}

void SetFrameWillChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetFrameWillChangeBlock:block];
    }
}

void AddFrameWillChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddFrameWillChangeBlock:block];
    }
}

void SetFrameDidChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetFrameDidChangeBlock:block];
    }
}

void AddFrameDidChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddFrameDidChangeBlock:block];
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

void AddFrameDidChangeKeyBlock(UIView *view, NSString *key, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddFrameDidChangeKeyBlock:block AndKey:key];
    }
}

void AddFrameWillChangeKeyBlock(UIView *view, NSString *key, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddFrameWillChangeKeyBlock:block AndKey:key];
    }
}

void SetSuperViewFrameWillChangeBlock(UIView *view, viewSuperFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetSuperViewFrameWillChangeBlock:block];
    }
}

void AddSuperViewFrameWillChangeBlock(UIView *view, viewSuperFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddSuperViewFrameWillChangeBlock:block];
    }
}

void AddSuperViewFrameWillChangeKeyBlock(UIView *view, NSString *key, viewSuperFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddSuperViewFrameWillChangeKeyBlock:block AndKey:key];
    }
}

void SetSuperViewFrameDidChangeBlock(UIView *view, viewSuperFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetSuperViewFrameDidChangeBlock:block];
    }
}

void AddSuperViewFrameDidChangeBlock(UIView *view, viewSuperFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddSuperViewFrameDidChangeBlock:block];
    }
}

void AddSuperViewFrameDidChangeKeyBlock(UIView *view, NSString *key, viewSuperFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddSuperViewFrameDidChangeKeyBlock:block AndKey:key];
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

FOUNDATION_EXTERN void AddViewAddSubViewKeyBlock(UIView *view, NSString *key, viewAddSubView block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodAddsubViewBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddViewAddSubViewKeyBlock:block AndKey:key];
    }
}
