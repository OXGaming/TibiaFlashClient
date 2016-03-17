package tibia.sidebar.sideBarWidgetClasses
{
   import mx.controls.Button;
   import tibia.creatures.Player;
   import flash.events.MouseEvent;
   import tibia.network.Connection;
   import tibia.§sidebar:ns_sidebar_internal§.options;
   import tibia.options.OptionsStorage;
   import tibia.input.staticaction.StaticActionList;
   import shared.controls.CustomButton;
   import mx.core.EventPriority;
   import mx.events.PropertyChangeEvent;
   import mx.core.EdgeMetrics;
   import mx.core.UIComponent;
   import mx.containers.BoxDirection;
   import mx.core.ScrollPolicy;
   
   public class CombatControlWidgetView extends WidgetView
   {
      
      private static const BUNDLE:String = "CombatControlWidget";
      
      private static const WIDGET_VIEW_HEIGHT:Number = 47;
      
      private static const WIDGET_VIEW_WIDTH:Number = 176;
      
      private static const WIDGET_COMPONENT_POSITIONS:Array = [{
         "left":4,
         "top":2,
         "width":NaN,
         "height":NaN
      },{
         "left":27,
         "top":2,
         "width":NaN,
         "height":NaN
      },{
         "left":50,
         "top":2,
         "width":NaN,
         "height":NaN
      },{
         "left":4,
         "top":26,
         "width":NaN,
         "height":NaN
      },{
         "left":27,
         "top":26,
         "width":NaN,
         "height":NaN
      },{
         "left":50,
         "top":26,
         "width":NaN,
         "height":NaN
      },{
         "left":107,
         "top":6,
         "width":NaN,
         "height":NaN
      }];
       
      protected var m_UIButtonMount:Button = null;
      
      protected var m_Player:Player = null;
      
      protected var m_UIButtonStop:Button = null;
      
      private var m_UncommittedChaseMode:Boolean = true;
      
      protected var m_UIButtonBalanced:Button = null;
      
      private var m_UncommittedSecureMode:Boolean = true;
      
      protected var m_AttackMode:int = 1;
      
      protected var m_ChaseMode:int = 0;
      
      protected var m_UIButtonOffensive:Button = null;
      
      private var m_UncommittedMountMode:Boolean = true;
      
      private var m_UncommittedPlayer:Boolean = false;
      
      protected var m_UIButtonSecureMode:Button = null;
      
      protected var m_UIButtonDefensive:Button = null;
      
      protected var m_UIButtonChase:Button = null;
      
      protected var m_MountMode:Boolean = false;
      
      protected var m_SecureMode:int = 0;
      
      private var m_UncommittedAttackMode:Boolean = true;
      
      public function CombatControlWidgetView()
      {
         super();
         titleText = resourceManager.getString(BUNDLE,"TITLE");
         direction = BoxDirection.HORIZONTAL;
         horizontalScrollPolicy = ScrollPolicy.OFF;
         verticalScrollPolicy = ScrollPolicy.OFF;
      }
      
      function get attackMode() : int
      {
         return this.m_AttackMode;
      }
      
      private function onButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Connection = null;
         if(options != null)
         {
            param1.preventDefault();
            param1.stopImmediatePropagation();
            _loc2_ = false;
            if(param1.currentTarget == this.m_UIButtonOffensive)
            {
               options.combatAttackMode = OptionsStorage.COMBAT_ATTACK_OFFENSIVE;
               _loc2_ = true;
            }
            else if(param1.currentTarget == this.m_UIButtonBalanced)
            {
               options.combatAttackMode = OptionsStorage.COMBAT_ATTACK_BALANCED;
               _loc2_ = true;
            }
            else if(param1.currentTarget == this.m_UIButtonDefensive)
            {
               options.combatAttackMode = OptionsStorage.COMBAT_ATTACK_DEFENSIVE;
               _loc2_ = true;
            }
            else if(param1.currentTarget == this.m_UIButtonChase)
            {
               options.combatChaseMode = options.combatChaseMode == OptionsStorage.COMBAT_CHASE_ON?int(OptionsStorage.COMBAT_CHASE_OFF):int(OptionsStorage.COMBAT_CHASE_ON);
               _loc2_ = true;
            }
            else if(param1.currentTarget == this.m_UIButtonMount)
            {
               StaticActionList.PLAYER_MOUNT.perform();
            }
            else if(param1.currentTarget == this.m_UIButtonSecureMode)
            {
               options.combatSecureMode = options.combatSecureMode == OptionsStorage.COMBAT_SECURE_ON?int(OptionsStorage.COMBAT_SECURE_OFF):int(OptionsStorage.COMBAT_SECURE_ON);
               _loc2_ = true;
            }
            else if(param1.currentTarget == this.m_UIButtonStop)
            {
               StaticActionList.PLAYER_CANCEL.perform();
            }
            _loc3_ = null;
            if(Boolean(_loc2_) && (_loc3_ = Tibia.s_GetConnection()) != null && Boolean(_loc3_.isGameRunning))
            {
               _loc3_.sendCSETTACTICS(options.combatAttackMode,options.combatChaseMode,options.combatSecureMode);
            }
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.m_UIButtonChase = new CustomButton();
         this.m_UIButtonChase.selected = this.chaseMode == OptionsStorage.COMBAT_CHASE_ON;
         this.m_UIButtonChase.styleName = getStyle("buttonChaseStyle");
         this.m_UIButtonChase.toggle = true;
         this.m_UIButtonChase.toolTip = resourceManager.getString(BUNDLE,"TIP_CHASE");
         this.m_UIButtonChase.addEventListener(MouseEvent.CLICK,this.onButtonClick,false,EventPriority.DEFAULT + 1,false);
         addChild(this.m_UIButtonChase);
         this.m_UIButtonMount = new CustomButton();
         this.m_UIButtonMount.selected = this.mountMode;
         this.m_UIButtonMount.styleName = getStyle("buttonMountStyle");
         this.m_UIButtonMount.toggle = true;
         this.m_UIButtonMount.toolTip = resourceManager.getString(BUNDLE,"TIP_MOUNT");
         this.m_UIButtonMount.addEventListener(MouseEvent.CLICK,this.onButtonClick,false,EventPriority.DEFAULT + 1,false);
         addChild(this.m_UIButtonMount);
         this.m_UIButtonSecureMode = new CustomButton();
         this.m_UIButtonSecureMode.selected = this.secureMode == OptionsStorage.COMBAT_SECURE_ON;
         this.m_UIButtonSecureMode.styleName = getStyle("buttonSecureStyle");
         this.m_UIButtonSecureMode.toggle = true;
         this.m_UIButtonSecureMode.toolTip = resourceManager.getString(BUNDLE,"TIP_SECURE");
         this.m_UIButtonSecureMode.addEventListener(MouseEvent.CLICK,this.onButtonClick,false,EventPriority.DEFAULT + 1,false);
         addChild(this.m_UIButtonSecureMode);
         this.m_UIButtonOffensive = new CustomButton();
         this.m_UIButtonOffensive.selected = this.attackMode == OptionsStorage.COMBAT_ATTACK_OFFENSIVE;
         this.m_UIButtonOffensive.styleName = getStyle("buttonOffensiveStyle");
         this.m_UIButtonOffensive.toggle = true;
         this.m_UIButtonOffensive.toolTip = resourceManager.getString(BUNDLE,"TIP_ATTACK_OFFENSIVE");
         this.m_UIButtonOffensive.addEventListener(MouseEvent.CLICK,this.onButtonClick,false,EventPriority.DEFAULT + 1,false);
         addChild(this.m_UIButtonOffensive);
         this.m_UIButtonBalanced = new CustomButton();
         this.m_UIButtonBalanced.selected = this.attackMode == OptionsStorage.COMBAT_ATTACK_BALANCED;
         this.m_UIButtonBalanced.styleName = getStyle("buttonBalancedStyle");
         this.m_UIButtonBalanced.toggle = true;
         this.m_UIButtonBalanced.toolTip = resourceManager.getString(BUNDLE,"TIP_ATTACK_BALANCED");
         this.m_UIButtonBalanced.addEventListener(MouseEvent.CLICK,this.onButtonClick,false,EventPriority.DEFAULT + 1,false);
         addChild(this.m_UIButtonBalanced);
         this.m_UIButtonDefensive = new CustomButton();
         this.m_UIButtonDefensive.selected = this.attackMode == OptionsStorage.COMBAT_ATTACK_DEFENSIVE;
         this.m_UIButtonDefensive.styleName = getStyle("buttonDefensiveStyle");
         this.m_UIButtonDefensive.toggle = true;
         this.m_UIButtonDefensive.toolTip = resourceManager.getString(BUNDLE,"TIP_ATTACK_DEFENSIVE");
         this.m_UIButtonDefensive.addEventListener(MouseEvent.CLICK,this.onButtonClick,false,EventPriority.DEFAULT + 1,false);
         addChild(this.m_UIButtonDefensive);
         this.m_UIButtonStop = new CustomButton();
         this.m_UIButtonStop.styleName = getStyle("buttonStopStyle");
         this.m_UIButtonStop.toolTip = resourceManager.getString(BUNDLE,"TIP_STOP");
         this.m_UIButtonStop.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         addChild(this.m_UIButtonStop);
      }
      
      function set attackMode(param1:int) : void
      {
         if(this.m_AttackMode != param1)
         {
            this.m_AttackMode = param1;
            this.m_UncommittedAttackMode = true;
            invalidateProperties();
         }
      }
      
      function get chaseMode() : int
      {
         return this.m_ChaseMode;
      }
      
      function set mountMode(param1:Boolean) : void
      {
         if(this.m_MountMode != param1)
         {
            this.m_MountMode = param1;
            this.m_UncommittedMountMode = true;
            invalidateProperties();
         }
      }
      
      function get secureMode() : int
      {
         return this.m_SecureMode;
      }
      
      override function releaseInstance() : void
      {
         super.releaseInstance();
         this.m_UIButtonBalanced.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.m_UIButtonChase.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.m_UIButtonDefensive.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.m_UIButtonMount.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.m_UIButtonOffensive.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.m_UIButtonSecureMode.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.m_UIButtonStop.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
      }
      
      function set player(param1:Player) : void
      {
         if(this.m_Player != param1)
         {
            if(this.m_Player != null)
            {
               this.m_Player.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onPlayerChange);
            }
            this.m_Player = param1;
            this.m_UncommittedPlayer = true;
            invalidateProperties();
            if(this.m_Player != null)
            {
               this.m_Player.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onPlayerChange);
            }
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.m_UncommittedPlayer)
         {
            this.mountMode = this.m_Player != null && this.m_Player.mountOutfit != null;
            this.m_UncommittedPlayer = false;
         }
         if(this.m_UncommittedAttackMode)
         {
            this.m_UIButtonOffensive.selected = this.attackMode == OptionsStorage.COMBAT_ATTACK_OFFENSIVE;
            this.m_UIButtonBalanced.selected = this.attackMode == OptionsStorage.COMBAT_ATTACK_BALANCED;
            this.m_UIButtonDefensive.selected = this.attackMode == OptionsStorage.COMBAT_ATTACK_DEFENSIVE;
            this.m_UncommittedAttackMode = false;
         }
         if(this.m_UncommittedChaseMode)
         {
            this.m_UIButtonChase.selected = this.chaseMode == OptionsStorage.COMBAT_CHASE_ON;
            this.m_UncommittedChaseMode = false;
         }
         if(this.m_UncommittedMountMode)
         {
            this.m_UIButtonMount.selected = this.mountMode;
            this.m_UncommittedMountMode = false;
         }
         if(this.m_UncommittedSecureMode)
         {
            this.m_UIButtonSecureMode.selected = this.secureMode == OptionsStorage.COMBAT_SECURE_OFF;
            this.m_UncommittedSecureMode = false;
         }
      }
      
      override protected function onOptionsChange(param1:PropertyChangeEvent) : void
      {
         super.onOptionsChange(param1);
         if(param1.property == "*" || param1.property == "combatAttackMode")
         {
            this.attackMode = m_Options.combatAttackMode;
         }
         if(param1.property == "*" || param1.property == "combatChaseMode")
         {
            this.chaseMode = m_Options.combatChaseMode;
         }
         if(param1.property == "*" || param1.property == "combatSecureMode")
         {
            this.secureMode = m_Options.combatSecureMode;
         }
      }
      
      function get mountMode() : Boolean
      {
         return this.m_MountMode;
      }
      
      override protected function measure() : void
      {
         var _loc1_:EdgeMetrics = null;
         super.measure();
         _loc1_ = viewMetricsAndPadding;
         measuredMinWidth = measuredWidth = _loc1_.left + WIDGET_VIEW_WIDTH + _loc1_.right;
         measuredMinHeight = measuredHeight = _loc1_.top + WIDGET_VIEW_HEIGHT + _loc1_.bottom;
      }
      
      function get player() : Player
      {
         return this.m_Player;
      }
      
      function set chaseMode(param1:int) : void
      {
         if(this.m_ChaseMode != param1)
         {
            this.m_ChaseMode = param1;
            this.m_UncommittedChaseMode = true;
            invalidateProperties();
         }
      }
      
      override protected function commitOptions() : void
      {
         super.commitOptions();
         if(options != null)
         {
            this.attackMode = options.combatAttackMode;
            this.chaseMode = options.combatChaseMode;
            this.secureMode = options.combatSecureMode;
         }
         else
         {
            this.attackMode = OptionsStorage.COMBAT_ATTACK_OFFENSIVE;
            this.chaseMode = OptionsStorage.COMBAT_CHASE_OFF;
            this.secureMode = OptionsStorage.COMBAT_SECURE_OFF;
         }
      }
      
      private function onPlayerChange(param1:PropertyChangeEvent) : void
      {
         if(param1.property == "*" || param1.property == "mountOutfit")
         {
            this.mountMode = this.m_Player.mountOutfit != null;
         }
      }
      
      function set secureMode(param1:int) : void
      {
         if(this.m_SecureMode != param1)
         {
            this.m_SecureMode = param1;
            this.m_UncommittedSecureMode = true;
            invalidateProperties();
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc4_:UIComponent = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         super.updateDisplayList(param1,param2);
         var _loc3_:int = 0;
         while(_loc3_ < WIDGET_COMPONENT_POSITIONS.length)
         {
            _loc4_ = UIComponent(getChildAt(_loc3_));
            _loc5_ = !isNaN(WIDGET_COMPONENT_POSITIONS[_loc3_].height)?Number(WIDGET_COMPONENT_POSITIONS[_loc3_].height):Number(_loc4_.getExplicitOrMeasuredHeight());
            _loc6_ = !isNaN(WIDGET_COMPONENT_POSITIONS[_loc3_].width)?Number(WIDGET_COMPONENT_POSITIONS[_loc3_].width):Number(_loc4_.getExplicitOrMeasuredWidth());
            _loc4_.move(WIDGET_COMPONENT_POSITIONS[_loc3_].left,WIDGET_COMPONENT_POSITIONS[_loc3_].top);
            _loc4_.setActualSize(_loc6_,_loc5_);
            _loc3_++;
         }
      }
   }
}
