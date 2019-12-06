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
void viewsetFrameChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model SetFrameDidChangeBlock:block];
    }
}

void viewAddFrameChangeBlock(UIView *view, viewFrameChangeBlock block)
{
    if ([view isKindOfClass:UIView.class] && block) {
        [LJViewMethodExchangeUtil methodFrameChangeBlock_MethodExchang];
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModel];
        [model AddFrameDidChangeBlock:block];
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
