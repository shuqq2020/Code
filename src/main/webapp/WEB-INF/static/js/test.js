var screenAnimateElements = {
    '.header':[
        '.header__wrap',
    ],
    '.screen-1':[
        '.screen-1__heading',
        '.screen-1__heading-descrip',
    ],
    '.screen-2':[
        '.screen-2__heading',
        '.screen-2__sub-heading-tip',
        '.screen-2__sub-heading',
        '.screen-2__banner_i_2',
        '.screen-2__banner_i_3',
    ],
    '.screen-3':[
        '.screen-3__icon',
        '.screen-3__content__heading',
        '.screen-3__content__tip',
        '.screen-3__content__subheading',
        '.screen-3__content__items',
    ],
    '.screen-4':[
        '.screen-4__heading',
        '.screen-4__tips',
        '.screen-4__subheading',
        '.screen-4__items-wrap1',
        '.screen-4__items-wrap2',
        '.screen-4__items-wrap3',
        '.screen-4__items-wrap4',
    ],
    '.screen-5':[
        '.screen-5_icon',
        '.screen-5_heading',
        '.screen-5_tip',
        '.screen-5_subheading',
    ],
};

function setScreenAnimate(screenCls) {
    var screen = document.querySelector(screenCls);//获取当前屏的元素
    var animateElements = screenAnimateElements[screenCls];//需要设置动画的元素

    var isSetAnimateClass = false;
    // 是否有初始化子元素的样式,由于Class中没有动画init和done的类名,所以false 执行初始化样式

    var isAnimateDone = false;
    //当前屏幕下所有子元素的状态是DONE？默认false不是done

    screen.onclick = function () {
        //  初始化样式，增加init A A_init
        if (isSetAnimateClass === false) {
            for (var i = 0;i<animateElements.length;i++){
                var element = document.querySelector(animateElements[i]);
                var baseCls = element.getAttribute('class');

                element.setAttribute('class',baseCls + ' ' + animateElements[i].substr(1) + '_animate_init');
            }
            isSetAnimateClass = true;
            return ;
        }

        //  切换所有 animateElements 的  init -> done   A A_done
        if (isAnimateDone === false) {
            for (var i = 0;i<animateElements.length;i++){
                var element = document.querySelector(animateElements[i]);
                var baseCls = element.getAttribute('class');

                element.setAttribute('class',baseCls.replace('_animate_init','_animate_done'));
            }
            isAnimateDone = true;
            return ;
        }

        //  切换所有 animateElements 的  done -> init   A A_done
        if (isAnimateDone === true) {
            for (var i = 0;i<animateElements.length;i++){
                var element = document.querySelector(animateElements[i]);
                var baseCls = element.getAttribute('class');

                element.setAttribute('class',baseCls.replace('_animate_done','_animate_init'));
            }
            isAnimateDone = false;
            return ;
        }
    }

}

for(k in screenAnimateElements){
    setScreenAnimate(k);
}