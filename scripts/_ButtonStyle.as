﻿package 
{
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _ButtonStyle extends Object
    {

        public function _ButtonStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration("Button");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("Button", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.horizontalGap = 2;
                this.paddingBottom = 2;
                this.textAlign = "center";
                this.paddingRight = 10;
                this.skin = ButtonSkin;
                this.paddingTop = 2;
                this.verticalGap = 2;
                this.paddingLeft = 10;
                this.fontWeight = "bold";
                this.cornerRadius = 4;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
