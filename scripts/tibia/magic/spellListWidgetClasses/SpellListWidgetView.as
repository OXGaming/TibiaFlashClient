package tibia.magic.spellListWidgetClasses
{
   import tibia.sidebar.sideBarWidgetClasses.WidgetView;
   import mx.controls.listClasses.ListBase;
   import mx.core.ClassFactory;
   import tibia.magic.SpellListWidget;
   import shared.controls.CustomList;
   import mx.core.ScrollPolicy;
   import shared.controls.CustomTileList;
   import mx.events.ListEvent;
   import flash.events.MouseEvent;
   import shared.utility.replaceChild;
   import mx.core.EventPriority;
   import tibia.creatures.Player;
   import mx.containers.Form;
   import mx.controls.HRule;
   import mx.containers.VBox;
   import mx.controls.Spacer;
   import mx.containers.Box;
   import mx.containers.FormHeading;
   import mx.containers.HBox;
   import mx.controls.Button;
   import tibia.§sidebar:ns_sidebar_internal§.layoutMode;
   import mx.controls.RadioButtonGroup;
   import mx.events.ItemClickEvent;
   import mx.containers.ViewStack;
   import shared.controls.SimpleTabBar;
   import tibia.§sidebar:ns_sidebar_internal§.widgetInstance;
   import tibia.magic.Spell;
   import mx.controls.Label;
   import mx.controls.TabBar;
   import shared.controls.CustomLabel;
   import mx.containers.FormItem;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.collections.ArrayCollection;
   import mx.controls.RadioButton;
   import mx.collections.Sort;
   import tibia.magic.SpellStorage;
   
   public class SpellListWidgetView extends WidgetView
   {
      
      protected static const PROFESSION_MASK_DRUID:int = 1 << PROFESSION_DRUID;
      
      protected static const STATE_PZ_BLOCK:int = 13;
      
      protected static const GROUP_HEALING:int = 2;
      
      protected static const PROFESSION_SORCERER:int = 3;
      
      protected static const PK_REVENGE:int = 6;
      
      protected static const STATE_SLOW:int = 5;
      
      protected static const PARTY_NONE:int = 0;
      
      protected static const PARTY_MEMBER_SEXP_ACTIVE:int = 5;
      
      protected static const PROFESSION_MASK_SORCERER:int = 1 << PROFESSION_SORCERER;
      
      protected static const SKILL_FIGHTCLUB:int = 9;
      
      protected static const TYPE_NONE:int = 0;
      
      protected static const GROUP_NONE:int = 0;
      
      protected static const PK_PARTYMODE:int = 2;
      
      protected static const WAR_ALLY:int = 1;
      
      protected static const PROFESSION_MASK_NONE:int = 1 << PROFESSION_NONE;
      
      protected static const GROUP_ATTACK:int = 1;
      
      protected static const WAR_ENEMY:int = 2;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_GUILTY:int = 8;
      
      protected static const PARTY_MEMBER:int = 2;
      
      protected static const STATE_DRUNK:int = 3;
      
      protected static const WAR_NEUTRAL:int = 3;
      
      protected static const SKILL_EXPERIENCE:int = 0;
      
      protected static const TYPE_NPC:int = 2;
      
      protected static const PROFESSION_KNIGHT:int = 1;
      
      protected static const SKILL_STAMINA:int = 16;
      
      protected static const GROUP_POWERSTRIKES:int = 4;
      
      protected static const STATE_NONE:int = -1;
      
      protected static const PROFESSION_PALADIN:int = 2;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_GUILTY:int = 7;
      
      protected static const SKILL_FIGHTSHIELD:int = 7;
      
      protected static const SKILL_FIGHTAXE:int = 11;
      
      protected static const WAR_NONE:int = 0;
      
      protected static const SKILL_FIGHTDISTANCE:int = 8;
      
      protected static const PK_EXCPLAYERKILLER:int = 5;
      
      protected static const NUM_CREATURES:int = 1300;
      
      protected static const NUM_TRAPPERS:int = 8;
      
      protected static const SKILL_FED:int = 14;
      
      protected static const SKILL_MAGLEVEL:int = 2;
      
      protected static const SKILL_SOULPOINTS:int = 15;
      
      protected static const TYPE_RUNE:int = 2;
      
      protected static const SKILL_FISHING:int = 13;
      
      protected static const PARTY_LEADER_SEXP_OFF:int = 4;
      
      protected static const PK_PLAYERKILLER:int = 4;
      
      protected static const STATE_FAST:int = 6;
      
      protected static const STATE_BLEEDING:int = 15;
      
      protected static const STATE_DAZZLED:int = 10;
      
      protected static const PROFESSION_MASK_KNIGHT:int = 1 << PROFESSION_KNIGHT;
      
      protected static const TYPE_PLAYER:int = 0;
      
      protected static const SKILL_HITPOINTS:int = 3;
      
      protected static const SKILL_NONE:int = -1;
      
      private static const BUNDLE:String = "SpellListWidget";
      
      protected static const STATE_MANA_SHIELD:int = 4;
      
      protected static const SKILL_MANA:int = 4;
      
      protected static const PROFESSION_MASK_PALADIN:int = 1 << PROFESSION_PALADIN;
      
      protected static const MAX_NAME_LENGTH:int = 29;
      
      protected static const STATE_CURSED:int = 11;
      
      protected static const STATE_FREEZING:int = 9;
      
      protected static const PARTY_LEADER:int = 1;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_INNOCENT:int = 10;
      
      protected static const STATE_PZ_ENTERED:int = 14;
      
      protected static const PROFESSION_NONE:int = 0;
      
      protected static const PK_ATTACKER:int = 1;
      
      protected static const STATE_ELECTRIFIED:int = 2;
      
      protected static const SKILL_FIGHTSWORD:int = 10;
      
      protected static const TYPE_MONSTER:int = 1;
      
      protected static const SKILL_CARRYSTRENGTH:int = 6;
      
      protected static const TYPE_INSTANT:int = 1;
      
      protected static const STATE_POISONED:int = 0;
      
      protected static const STATE_BURNING:int = 1;
      
      protected static const SKILL_FIGHTFIST:int = 12;
      
      protected static const STATE_DROWNING:int = 8;
      
      protected static const GROUP_SUPPORT:int = 3;
      
      protected static const PK_AGGRESSOR:int = 3;
      
      protected static const SKILL_LEVEL:int = 1;
      
      protected static const STATE_STRENGTHENED:int = 12;
      
      protected static const STATE_HUNGRY:int = 31;
      
      protected static const PROFESSION_MASK_ANY:int = PROFESSION_MASK_DRUID | PROFESSION_MASK_KNIGHT | PROFESSION_MASK_PALADIN | PROFESSION_MASK_SORCERER;
      
      protected static const PROFESSION_DRUID:int = 4;
      
      protected static const PARTY_MEMBER_SEXP_OFF:int = 3;
      
      protected static const STATE_FIGHTING:int = 7;
      
      protected static const SKILL_GOSTRENGTH:int = 5;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_INNOCENT:int = 9;
      
      protected static const PK_NONE:int = 0;
      
      protected static const PARTY_LEADER_SEXP_ACTIVE:int = 6;
       
      private var m_Player:Player = null;
      
      private var m_UncommittedFilterGroup:Boolean = true;
      
      private var m_SortMode:int;
      
      private var m_UncommittedFilterLevel:Boolean = true;
      
      private var m_LayoutMode:int;
      
      private var m_UIConstructed:Boolean = false;
      
      private var m_UncommittedFilterPremium:Boolean = true;
      
      private var m_UIInfoName:Label = null;
      
      private var m_UIInfoPrice:Label = null;
      
      private var m_UIInfoPremium:Label = null;
      
      private var m_FilterProfession:int = -1;
      
      private var m_UIQuickProfession:Button = null;
      
      private var m_UIRootBar:TabBar = null;
      
      private var m_FilterPremium:int = -1;
      
      private var m_UncommittedPlayer:Boolean = false;
      
      private var m_UIInfoFormula:Label = null;
      
      private var m_UIFilterProfession:RadioButtonGroup = null;
      
      private var m_UIFilterGroup:RadioButtonGroup = null;
      
      private var m_UIView:ListBase = null;
      
      private var m_UIInfoDelay:Label = null;
      
      private var m_UIInfoLevel:Label = null;
      
      private var m_UIInfoGroup:Label = null;
      
      private var m_UIInfoProfession:Label = null;
      
      private var m_UncommittedSortMode:Boolean = false;
      
      private var m_UncommittedSpell:Boolean = false;
      
      private var m_UIViewToggle:Button = null;
      
      private var m_UIQuickKnown:Button = null;
      
      private var m_Spell:Spell = null;
      
      private var m_UIFilterPremium:RadioButtonGroup = null;
      
      private var m_FilterKnown:int = -1;
      
      private var m_SpellsView:ArrayCollection = null;
      
      private var m_UncommittedFilterProfession:Boolean = true;
      
      private var m_UIRootStack:ViewStack = null;
      
      private var m_UIInfoType:Label = null;
      
      private var m_UIInfoCast:Label = null;
      
      private var m_InvalidatedSort:Boolean = false;
      
      private var m_UncommittedFilterKnown:Boolean = true;
      
      private var m_UIQuickLevel:Button = null;
      
      private var m_UncommittedLayoutMode:Boolean = false;
      
      private var m_InvalidatedFilter:Boolean = false;
      
      private var m_FilterGroup:int = -1;
      
      private var m_FilterLevel:int = -1;
      
      public function SpellListWidgetView()
      {
         this.m_LayoutMode = SpellListWidget.LAYOUT_LIST;
         this.m_SortMode = SpellListWidget.SORT_NAME;
         super();
         horizontalScrollPolicy = ScrollPolicy.OFF;
         verticalScrollPolicy = ScrollPolicy.OFF;
         maxHeight = int.MAX_VALUE;
         titleText = resourceManager.getString(BUNDLE,"TITLE");
         var _loc1_:Sort = new Sort();
         _loc1_.compareFunction = this.compareSpell;
         this.m_SpellsView = new ArrayCollection(SpellStorage.SPELLS);
         this.m_SpellsView.filterFunction = this.filterSpell;
         this.m_SpellsView.sort = _loc1_;
         this.m_SpellsView.refresh();
      }
      
      private function compareSpellGroup(param1:int, param2:int) : int
      {
         if(param1 == GROUP_ATTACK)
         {
            if(param2 == GROUP_ATTACK)
            {
               return 0;
            }
            if(param2 == GROUP_HEALING)
            {
               return -1;
            }
            return -1;
         }
         if(param1 == GROUP_HEALING)
         {
            if(param2 == GROUP_ATTACK)
            {
               return 1;
            }
            if(param2 == GROUP_HEALING)
            {
               return 0;
            }
            return -1;
         }
         if(param2 == GROUP_ATTACK)
         {
            return 1;
         }
         if(param2 == GROUP_HEALING)
         {
            return 1;
         }
         return 0;
      }
      
      private function updateView(param1:ListBase) : ListBase
      {
         var _loc2_:ListBase = null;
         var _loc3_:ClassFactory = null;
         if(this.layoutMode == SpellListWidget.LAYOUT_LIST)
         {
            _loc3_ = new ClassFactory();
            _loc3_.generator = SpellListRenderer;
            _loc3_.properties = {"player":this.player};
            _loc2_ = new CustomList();
            _loc2_.itemRenderer = _loc3_;
            _loc2_.setStyle("backgroundAlpha",0.5);
            _loc2_.setStyle("backgroundColor",undefined);
            _loc2_.setStyle("alternatingItemAlphas",[0.5,0.5]);
            _loc2_.setStyle("alternatingItemColors",[2768716,1977654]);
            _loc2_.setStyle("rollOverColor",undefined);
            _loc2_.setStyle("selectionColor",undefined);
            _loc2_.setStyle("paddingBottom",1);
            _loc2_.setStyle("paddingTop",1);
         }
         else
         {
            _loc3_ = new ClassFactory();
            _loc3_.generator = SpellTileRenderer;
            _loc3_.properties = {
               "height":36,
               "width":36,
               "horizontalScrollPolicy":ScrollPolicy.OFF,
               "verticalScrollPolicy":ScrollPolicy.OFF,
               "player":this.player,
               "styleName":{
                  "paddingLeft":1,
                  "paddingRight":1,
                  "paddingTop":1,
                  "paddingBottom":1
               }
            };
            _loc2_ = new CustomTileList();
            _loc2_.columnCount = 4;
            _loc2_.columnWidth = _loc3_.properties.width;
            _loc2_.itemRenderer = _loc3_;
            _loc2_.rowHeight = _loc3_.properties.height;
            _loc2_.setStyle("backgroundColor",0);
            _loc2_.setStyle("backgroundAlpha",0);
            _loc2_.setStyle("borderAlpha",0);
            _loc2_.setStyle("borderColor",0);
            _loc2_.setStyle("borderStyle","none");
            _loc2_.setStyle("borderThickness",0);
            _loc2_.setStyle("paddingBottom",0);
            _loc2_.setStyle("paddingTop",0);
         }
         if(param1 != null)
         {
            param1.dataProvider = null;
            param1.removeEventListener(ListEvent.CHANGE,this.onViewSelectionChange);
            param1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onViewDisableDragScrolling);
            replaceChild(param1,_loc2_);
         }
         _loc2_.dataProvider = this.m_SpellsView;
         _loc2_.percentHeight = 100;
         _loc2_.percentWidth = 100;
         _loc2_.verticalScrollPolicy = ScrollPolicy.ON;
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onViewDisableDragScrolling,false,EventPriority.DEFAULT - 1,false);
         _loc2_.addEventListener(ListEvent.CHANGE,this.onViewSelectionChange);
         return _loc2_;
      }
      
      override protected function createChildren() : void
      {
         var ViewMode:VBox = null;
         var _Box:Box = null;
         var _Spacer:Spacer = null;
         var _HRule:HRule = null;
         var _Form:Form = null;
         var FilterMode:VBox = null;
         var _FormHeading:FormHeading = null;
         if(!this.m_UIConstructed)
         {
            super.createChildren();
            ViewMode = new VBox();
            ViewMode.percentHeight = 100;
            ViewMode.percentWidth = 100;
            ViewMode.label = resourceManager.getString(BUNDLE,"ROOT_VIEW");
            ViewMode.addEventListener(MouseEvent.RIGHT_CLICK,this.onViewContextMenu);
            ViewMode.setStyle("verticalGap",2);
            _Box = new HBox();
            _Box.percentWidth = 100;
            _Box.setStyle("horizontalGap",2);
            this.m_UIQuickProfession = new Button();
            this.m_UIQuickProfession.label = resourceManager.getString(BUNDLE,"BTN_MY_PROFESSION");
            this.m_UIQuickProfession.toggle = true;
            this.m_UIQuickProfession.addEventListener(MouseEvent.CLICK,this.onQuickFilterToggle,false,EventPriority.DEFAULT + 1,false);
            this.m_UIQuickProfession.setStyle("fontSize",9);
            this.m_UIQuickProfession.setStyle("paddingLeft",2);
            this.m_UIQuickProfession.setStyle("paddingRight",2);
            _Box.addChild(this.m_UIQuickProfession);
            this.m_UIQuickLevel = new Button();
            this.m_UIQuickLevel.label = resourceManager.getString(BUNDLE,"BTN_MY_LEVEL");
            this.m_UIQuickLevel.toggle = true;
            this.m_UIQuickLevel.addEventListener(MouseEvent.CLICK,this.onQuickFilterToggle);
            this.m_UIQuickLevel.setStyle("fontSize",9);
            this.m_UIQuickLevel.setStyle("paddingLeft",2);
            this.m_UIQuickLevel.setStyle("paddingRight",2);
            _Box.addChild(this.m_UIQuickLevel);
            this.m_UIQuickKnown = new Button();
            this.m_UIQuickKnown.label = resourceManager.getString(BUNDLE,"BTN_MY_KNOWN");
            this.m_UIQuickKnown.toggle = true;
            this.m_UIQuickKnown.addEventListener(MouseEvent.CLICK,this.onQuickFilterToggle);
            this.m_UIQuickKnown.setStyle("fontSize",9);
            this.m_UIQuickKnown.setStyle("paddingLeft",2);
            this.m_UIQuickKnown.setStyle("paddingRight",2);
            _Box.addChild(this.m_UIQuickKnown);
            _Spacer = new Spacer();
            _Spacer.percentWidth = 100;
            _Box.addChild(_Spacer);
            this.m_UIViewToggle = new Button();
            this.m_UIViewToggle.styleName = "spellListWidgetViewToggle";
            this.m_UIViewToggle.toggle = true;
            this.m_UIViewToggle.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
            {
               layoutMode = layoutMode == SpellListWidget.LAYOUT_LIST?int(SpellListWidget.LAYOUT_TILE):int(SpellListWidget.LAYOUT_LIST);
            });
            _Box.addChild(this.m_UIViewToggle);
            ViewMode.addChild(_Box);
            _HRule = new HRule();
            _HRule.percentWidth = 100;
            ViewMode.addChild(_HRule);
            this.m_UIView = this.updateView(null);
            ViewMode.addChild(this.m_UIView);
            _HRule = new HRule();
            _HRule.percentWidth = 100;
            ViewMode.addChild(_HRule);
            _Form = new Form();
            _Form.percentWidth = 100;
            _Form.styleName = "spellListWidgetForm";
            this.m_UIInfoName = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_NAME"));
            this.m_UIInfoFormula = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_FORMULA"));
            this.m_UIInfoProfession = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_PROFESSION"));
            this.m_UIInfoGroup = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_GROUP"));
            this.m_UIInfoType = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_TYPE"));
            this.m_UIInfoDelay = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_DELAY"));
            this.m_UIInfoCast = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_CAST"));
            this.m_UIInfoLevel = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_LEVEL"));
            this.m_UIInfoPrice = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_PRICE"));
            this.m_UIInfoPremium = this.createInfoLabel(_Form,resourceManager.getString(BUNDLE,"FRM_ITEM_PREMIUM"));
            ViewMode.addChild(_Form);
            FilterMode = new VBox();
            FilterMode.percentHeight = 100;
            FilterMode.percentWidth = 100;
            FilterMode.label = resourceManager.getString(BUNDLE,"ROOT_FILTER");
            FilterMode.setStyle("horizontalAlign","center");
            _Form = new Form();
            _Form.styleName = "spellListWidgetForm";
            _Form.setStyle("paddingBottom",0);
            _Form.setStyle("paddingTop",0);
            _Form.setStyle("verticalGap",0);
            _FormHeading = new FormHeading();
            _FormHeading.label = resourceManager.getString(BUNDLE,"FRM_ITEM_PROFESSION");
            _Form.addChild(_FormHeading);
            this.m_UIFilterProfession = new RadioButtonGroup();
            this.m_UIFilterProfession.addEventListener(ItemClickEvent.ITEM_CLICK,this.onDetailFilterChange);
            this.createFilterRadioButton(_Form,this.m_UIFilterProfession,this.formatSpellProfessionMask(-1),-1);
            this.createFilterRadioButton(_Form,this.m_UIFilterProfession,this.formatSpellProfessionMask(PROFESSION_MASK_DRUID),PROFESSION_DRUID);
            this.createFilterRadioButton(_Form,this.m_UIFilterProfession,this.formatSpellProfessionMask(PROFESSION_MASK_KNIGHT),PROFESSION_KNIGHT);
            this.createFilterRadioButton(_Form,this.m_UIFilterProfession,this.formatSpellProfessionMask(PROFESSION_MASK_PALADIN),PROFESSION_PALADIN);
            this.createFilterRadioButton(_Form,this.m_UIFilterProfession,this.formatSpellProfessionMask(PROFESSION_MASK_SORCERER),PROFESSION_SORCERER);
            _FormHeading = new FormHeading();
            _FormHeading.label = resourceManager.getString(BUNDLE,"FRM_ITEM_GROUP");
            _Form.addChild(_FormHeading);
            this.m_UIFilterGroup = new RadioButtonGroup();
            this.m_UIFilterGroup.addEventListener(ItemClickEvent.ITEM_CLICK,this.onDetailFilterChange);
            this.createFilterRadioButton(_Form,this.m_UIFilterGroup,this.formatSpellGroup(-1),-1);
            this.createFilterRadioButton(_Form,this.m_UIFilterGroup,this.formatSpellGroup(GROUP_ATTACK),GROUP_ATTACK);
            this.createFilterRadioButton(_Form,this.m_UIFilterGroup,this.formatSpellGroup(GROUP_HEALING),GROUP_HEALING);
            this.createFilterRadioButton(_Form,this.m_UIFilterGroup,this.formatSpellGroup(GROUP_SUPPORT),GROUP_SUPPORT);
            _FormHeading = new FormHeading();
            _FormHeading.label = resourceManager.getString(BUNDLE,"FRM_ITEM_PREMIUM");
            _Form.addChild(_FormHeading);
            this.m_UIFilterPremium = new RadioButtonGroup();
            this.m_UIFilterPremium.addEventListener(ItemClickEvent.ITEM_CLICK,this.onDetailFilterChange);
            this.createFilterRadioButton(_Form,this.m_UIFilterPremium,resourceManager.getString(BUNDLE,"FRM_LABEL_PREMIUM_ANY"),-1);
            this.createFilterRadioButton(_Form,this.m_UIFilterPremium,resourceManager.getString(BUNDLE,"FRM_LABEL_PREMIUM_NO"),0);
            this.createFilterRadioButton(_Form,this.m_UIFilterPremium,resourceManager.getString(BUNDLE,"FRM_LABEL_PREMIUM_YES"),1);
            FilterMode.addChild(_Form);
            this.m_UIRootStack = new ViewStack();
            this.m_UIRootStack.percentHeight = 100;
            this.m_UIRootStack.percentWidth = 100;
            this.m_UIRootStack.styleName = "spellListWidgetTabContent";
            this.m_UIRootStack.addChild(ViewMode);
            this.m_UIRootStack.addChild(FilterMode);
            this.m_UIRootBar = new SimpleTabBar();
            this.m_UIRootBar.dataProvider = this.m_UIRootStack;
            this.m_UIRootBar.percentWidth = 100;
            this.m_UIRootBar.styleName = "spellListWidgetTabBar";
            _Box = new HBox();
            _Box.height = 27;
            _Box.percentWidth = 100;
            _Box.styleName = "spellListWidgetTabBarBackground";
            _Box.addChild(this.m_UIRootBar);
            addChild(_Box);
            addChild(this.m_UIRootStack);
            this.m_UIConstructed = true;
         }
      }
      
      function set filterProfession(param1:int) : void
      {
         if(widgetInstance is SpellListWidget)
         {
            SpellListWidget(widgetInstance).filterProfession = param1;
         }
         if(this.m_FilterProfession != param1)
         {
            this.m_FilterProfession = param1;
            this.m_UncommittedFilterProfession = true;
            invalidateProperties();
            this.invalidateFilter();
         }
      }
      
      private function compareSpellProfessionMask(param1:int, param2:int) : int
      {
         var _loc3_:Array = [PROFESSION_MASK_DRUID,PROFESSION_MASK_KNIGHT,PROFESSION_MASK_PALADIN,PROFESSION_MASK_SORCERER];
         var _loc4_:* = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = (param1 & _loc3_[_loc6_]) == _loc3_[_loc6_];
            _loc5_ = (param2 & _loc3_[_loc6_]) == _loc3_[_loc6_];
            if(Boolean(_loc4_) && !_loc5_)
            {
               return -1;
            }
            if(!_loc4_ && Boolean(_loc5_))
            {
               return 1;
            }
            _loc6_++;
         }
         return 0;
      }
      
      function get spell() : Spell
      {
         return this.m_Spell;
      }
      
      function set spell(param1:Spell) : void
      {
         var _loc2_:Array = this.m_SpellsView.source;
         var _loc3_:int = _loc2_ != null?int(_loc2_.length - 1):-1;
         while(_loc3_ >= 0)
         {
            if(_loc2_[_loc3_] == param1)
            {
               break;
            }
            _loc3_--;
         }
         if(_loc3_ == -1)
         {
            param1 = null;
         }
         if(this.m_Spell != param1)
         {
            this.m_Spell = param1;
            this.m_UncommittedSpell = true;
            invalidateProperties();
         }
      }
      
      private function createInfoLabel(param1:Form, param2:String) : Label
      {
         var _loc3_:Label = new CustomLabel();
         _loc3_.percentWidth = 100;
         _loc3_.styleName = "spellListWidgetForm";
         _loc3_.truncateToFit = true;
         _loc3_.setStyle("fontWeight","bold");
         _loc3_.setStyle("fontSize",9);
         var _loc4_:FormItem = new FormItem();
         _loc4_.label = param2;
         _loc4_.percentWidth = 100;
         _loc4_.addChild(_loc3_);
         _loc4_.setStyle("fontSize",8);
         param1.addChild(_loc4_);
         return _loc3_;
      }
      
      protected function compareSpell(param1:Spell, param2:Spell, param3:Array = null) : int
      {
         var _loc4_:int = 0;
         switch(Math.abs(this.sortMode))
         {
            case SpellListWidget.SORT_FORMULA:
               if(param1.formula < param2.formula)
               {
                  _loc4_ = -1;
               }
               else if(param1.formula > param2.formula)
               {
                  _loc4_ = 1;
               }
               break;
            case SpellListWidget.SORT_GROUP:
               _loc4_ = this.compareSpellGroup(param1.groupPrimary,param2.groupPrimary);
               break;
            case SpellListWidget.SORT_LEVEL:
               _loc4_ = param1.restrictLevel - param2.restrictLevel;
               if(_loc4_ != 0)
               {
                  _loc4_ = _loc4_ / Math.abs(_loc4_);
               }
               break;
            case SpellListWidget.SORT_PREMIUM:
               if(Boolean(param1.restrictPremium) && !param2.restrictPremium)
               {
                  _loc4_ = -1;
               }
               else if(!param1.restrictPremium && Boolean(param2.restrictPremium))
               {
                  _loc4_ = 1;
               }
               break;
            case SpellListWidget.SORT_PRICE:
               _loc4_ = param1.price - param2.price;
               if(_loc4_ != 0)
               {
                  _loc4_ = _loc4_ / Math.abs(_loc4_);
               }
               break;
            case SpellListWidget.SORT_PROFESSION:
               _loc4_ = this.compareSpellProfessionMask(param1.restrictProfession,param2.restrictProfession);
               break;
            default:
               _loc4_ = 0;
         }
         if(_loc4_ == 0)
         {
            if(param1.name < param2.name)
            {
               _loc4_ = -1;
            }
            else if(param1.name > param2.name)
            {
               _loc4_ = 1;
            }
         }
         if(this.sortMode < 0)
         {
            return -_loc4_;
         }
         return _loc4_;
      }
      
      function set filterKnown(param1:int) : void
      {
         if(widgetInstance is SpellListWidget)
         {
            SpellListWidget(widgetInstance).filterKnown = param1;
         }
         if(this.m_FilterKnown != param1)
         {
            this.m_FilterKnown = param1;
            this.m_UncommittedFilterKnown = true;
            invalidateProperties();
            this.invalidateFilter();
         }
      }
      
      function get sortMode() : int
      {
         return this.m_SortMode;
      }
      
      private function formatSpellType(param1:int) : String
      {
         switch(param1)
         {
            case -1:
               return resourceManager.getString(BUNDLE,"FRM_LABEL_TYPE_ANY");
            case TYPE_INSTANT:
               return resourceManager.getString(BUNDLE,"FRM_LABEL_TYPE_INSTANT");
            case TYPE_RUNE:
               return resourceManager.getString(BUNDLE,"FRM_LABEL_TYPE_RUNE");
            default:
               return null;
         }
      }
      
      private function onViewDisableDragScrolling(param1:MouseEvent) : void
      {
         this.m_UIView.mx_internal::resetDragScrolling();
      }
      
      private function onQuickFilterToggle(param1:MouseEvent) : void
      {
         if(param1.currentTarget == this.m_UIQuickKnown)
         {
            this.filterKnown = this.filterKnown != -2?-2:-1;
         }
         else if(param1.currentTarget == this.m_UIQuickLevel)
         {
            this.filterLevel = this.filterLevel != -2?-2:-1;
         }
         else if(param1.currentTarget == this.m_UIQuickProfession)
         {
            this.filterProfession = this.filterProfession != -2?-2:-1;
         }
      }
      
      private function onPlayerChange(param1:PropertyChangeEvent) : void
      {
         if(param1.property == "knownSpells" || param1.property == "premium" || param1.property == "profession" || param1.property == "skill" || param1.property == "*")
         {
            this.invalidateFilter();
            this.invalidateSort();
         }
      }
      
      private function onDetailFilterChange(param1:ItemClickEvent) : void
      {
         if(param1.currentTarget == this.m_UIFilterGroup)
         {
            this.filterGroup = int(this.m_UIFilterGroup.selectedValue);
         }
         else if(param1.currentTarget == this.m_UIFilterPremium)
         {
            this.filterPremium = int(this.m_UIFilterPremium.selectedValue);
         }
         else if(param1.currentTarget == this.m_UIFilterProfession)
         {
            this.filterProfession = int(this.m_UIFilterProfession.selectedValue);
         }
      }
      
      function set filterPremium(param1:int) : void
      {
         if(widgetInstance is SpellListWidget)
         {
            SpellListWidget(widgetInstance).filterPremium = param1;
         }
         if(this.m_FilterPremium != param1)
         {
            this.m_FilterPremium = param1;
            this.m_UncommittedFilterPremium = true;
            invalidateProperties();
            this.invalidateFilter();
         }
      }
      
      protected function invalidateSort() : void
      {
         this.m_InvalidatedSort = true;
         invalidateProperties();
      }
      
      private function formatSpellGroup(param1:int) : String
      {
         switch(param1)
         {
            case -1:
               return resourceManager.getString(BUNDLE,"FRM_LABEL_GROUP_ANY");
            case GROUP_ATTACK:
               return resourceManager.getString(BUNDLE,"FRM_LABEL_GROUP_ATTACK");
            case GROUP_HEALING:
               return resourceManager.getString(BUNDLE,"FRM_LABEL_GROUP_HEALING");
            case GROUP_POWERSTRIKES:
               return resourceManager.getString(BUNDLE,"FRM_LABEL_GROUP_POWERSTRIKES");
            case GROUP_SUPPORT:
               return resourceManager.getString(BUNDLE,"FRM_LABEL_GROUP_SUPPORT");
            default:
               return null;
         }
      }
      
      protected function invalidateFilter() : void
      {
         this.m_InvalidatedFilter = true;
         invalidateProperties();
      }
      
      function get filterProfession() : int
      {
         return this.m_FilterProfession;
      }
      
      private function onViewSelectionChange(param1:ListEvent) : void
      {
         this.spell = param1.itemRenderer.data as Spell;
      }
      
      protected function filterSpell(param1:Spell) : Boolean
      {
         if(this.player != null)
         {
            if(this.filterGroup != -1 && param1.groupPrimary != this.filterGroup)
            {
               return false;
            }
            if(this.filterKnown == -2 && !this.player.isSpellKnown(param1))
            {
               return false;
            }
            if(this.filterLevel == -2 && param1.restrictLevel > this.player.getSkillValue(SKILL_LEVEL))
            {
               return false;
            }
            if(this.filterPremium != -1 && this.filterPremium == 1 != param1.restrictPremium)
            {
               return false;
            }
            if(this.filterProfession == -2 && (param1.restrictProfession & 1 << this.player.profession) == 0)
            {
               return false;
            }
            if(this.filterProfession > -1 && (param1.restrictProfession & 1 << this.filterProfession) == 0)
            {
               return false;
            }
         }
         return true;
      }
      
      function get filterKnown() : int
      {
         return this.m_FilterKnown;
      }
      
      function get filterPremium() : int
      {
         return this.m_FilterPremium;
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:String = null;
         var _loc2_:Number = NaN;
         super.commitProperties();
         if(this.m_UncommittedFilterGroup)
         {
            this.m_UIFilterGroup.selectedValue = this.filterGroup;
            this.m_UncommittedFilterGroup = false;
         }
         if(this.m_UncommittedFilterKnown)
         {
            this.m_UIQuickKnown.selected = this.filterKnown == -2;
            this.m_UncommittedFilterKnown = false;
         }
         if(this.m_UncommittedFilterLevel)
         {
            this.m_UIQuickLevel.selected = this.filterLevel == -2;
            this.m_UncommittedFilterLevel = false;
         }
         if(this.m_UncommittedFilterPremium)
         {
            this.m_UIFilterPremium.selectedValue = this.filterPremium;
            this.m_UncommittedFilterPremium = false;
         }
         if(this.m_UncommittedFilterProfession)
         {
            if(this.filterProfession == -2)
            {
               this.m_UIFilterProfession.selectedValue = this.player != null?this.player.profession:-1;
            }
            else
            {
               this.m_UIFilterProfession.selectedValue = this.filterProfession;
            }
            this.m_UIQuickProfession.enabled = this.filterProfession < 0;
            this.m_UIQuickProfession.selected = this.filterProfession == -2;
            this.m_UncommittedFilterProfession = false;
         }
         if(this.m_UncommittedLayoutMode)
         {
            this.m_UIView = this.updateView(this.m_UIView);
            this.m_UIView.selectedItem = this.spell;
            this.m_UncommittedLayoutMode = false;
         }
         if(this.m_UncommittedPlayer)
         {
            this.m_UncommittedPlayer = false;
         }
         if(this.m_UncommittedSortMode)
         {
            this.m_UncommittedSortMode = false;
         }
         if(this.m_UncommittedSpell)
         {
            this.m_UIView.selectedItem = this.spell;
            if(this.spell != null)
            {
               _loc1_ = null;
               if(this.spell.castMana > 0)
               {
                  _loc1_ = String(this.spell.castMana);
               }
               else
               {
                  _loc1_ = resourceManager.getString(BUNDLE,"FRM_LABEL_MANA_VARYING");
               }
               this.m_UIInfoCast.text = _loc1_ + " / " + this.spell.castSoulPoints;
               this.m_UIInfoDelay.text = this.spell.delaySelf / 1000 + "s / " + this.spell.delayPrimary / 1000 + "s";
               if(this.spell.groupSecondary != GROUP_NONE)
               {
                  this.m_UIInfoDelay.text = this.m_UIInfoDelay.text + (" / " + this.spell.delaySecondary / 1000 + "s");
               }
               this.m_UIInfoFormula.text = this.spell.formula;
               this.m_UIInfoGroup.text = this.formatSpellGroup(this.spell.groupPrimary);
               if(this.spell.groupSecondary != GROUP_NONE)
               {
                  this.m_UIInfoGroup.text = this.m_UIInfoGroup.text + (" / " + this.formatSpellGroup(this.spell.groupSecondary));
               }
               this.m_UIInfoLevel.text = String(this.spell.restrictLevel);
               this.m_UIInfoName.text = this.spell.name;
               this.m_UIInfoPremium.text = !!this.spell.restrictPremium?resourceManager.getString(BUNDLE,"FRM_LABEL_PREMIUM_YES"):resourceManager.getString(BUNDLE,"FRM_LABEL_PREMIUM_NO");
               this.m_UIInfoPrice.text = String(this.spell.price);
               this.m_UIInfoProfession.text = this.formatSpellProfessionMask(this.spell.restrictProfession);
               this.m_UIInfoType.text = this.formatSpellType(this.spell.type);
            }
            else
            {
               this.m_UIInfoCast.text = null;
               this.m_UIInfoDelay.text = null;
               this.m_UIInfoFormula.text = null;
               this.m_UIInfoGroup.text = null;
               this.m_UIInfoLevel.text = null;
               this.m_UIInfoName.text = null;
               this.m_UIInfoPremium.text = null;
               this.m_UIInfoPrice.text = null;
               this.m_UIInfoProfession.text = null;
               this.m_UIInfoType.text = null;
            }
            this.m_UncommittedSpell = false;
         }
         if(Boolean(this.m_InvalidatedFilter) || Boolean(this.m_InvalidatedSort))
         {
            _loc2_ = this.m_UIView.verticalScrollPosition;
            this.m_SpellsView.refresh();
            this.m_UIView.validateNow();
            this.m_UIView.verticalScrollPosition = _loc2_;
            this.m_InvalidatedFilter = false;
            this.m_InvalidatedSort = false;
         }
      }
      
      function set player(param1:Player) : void
      {
         if(widgetInstance is SpellListWidget)
         {
            SpellListWidget(widgetInstance).player = param1;
         }
         if(this.m_Player != param1)
         {
            if(this.m_Player != null)
            {
               this.m_Player.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onPlayerChange);
            }
            this.m_Player = param1;
            if(this.m_Player != null)
            {
               this.m_Player.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onPlayerChange);
            }
            this.m_UncommittedPlayer = true;
            invalidateProperties();
            this.invalidateFilter();
         }
      }
      
      function set filterLevel(param1:int) : void
      {
         if(widgetInstance is SpellListWidget)
         {
            SpellListWidget(widgetInstance).filterLevel = param1;
         }
         if(this.m_FilterLevel != param1)
         {
            this.m_FilterLevel = param1;
            this.m_UncommittedFilterLevel = true;
            invalidateProperties();
            this.invalidateFilter();
         }
      }
      
      private function createFilterRadioButton(param1:Form, param2:RadioButtonGroup, param3:String, param4:Object) : RadioButton
      {
         var _loc5_:RadioButton = new RadioButton();
         _loc5_.group = param2;
         _loc5_.label = param3;
         _loc5_.styleName = "spellListWidgetForm";
         _loc5_.value = param4;
         var _loc6_:FormItem = new FormItem();
         _loc6_.percentWidth = 100;
         _loc6_.addChild(_loc5_);
         param1.addChild(_loc6_);
         return _loc5_;
      }
      
      function set layoutMode(param1:int) : void
      {
         if(widgetInstance is SpellListWidget)
         {
            SpellListWidget(widgetInstance).layoutMode = param1;
         }
         if(this.m_LayoutMode != param1)
         {
            this.m_LayoutMode = param1;
            this.m_UncommittedLayoutMode = true;
            invalidateProperties();
         }
      }
      
      function set sortMode(param1:int) : void
      {
         if(widgetInstance is SpellListWidget)
         {
            SpellListWidget(widgetInstance).sortMode = param1;
         }
         if(this.m_SortMode != param1)
         {
            this.m_SortMode = param1;
            this.m_UncommittedSortMode = true;
            invalidateProperties();
            this.invalidateSort();
         }
      }
      
      function set filterGroup(param1:int) : void
      {
         if(widgetInstance is SpellListWidget)
         {
            SpellListWidget(widgetInstance).filterGroup = param1;
         }
         if(this.m_FilterGroup != param1)
         {
            this.m_FilterGroup = param1;
            this.m_UncommittedFilterGroup = true;
            invalidateProperties();
            this.invalidateFilter();
         }
      }
      
      function get filterGroup() : int
      {
         return this.m_FilterGroup;
      }
      
      function get player() : Player
      {
         return this.m_Player;
      }
      
      function get filterLevel() : int
      {
         return this.m_FilterLevel;
      }
      
      private function formatSpellProfessionMask(param1:int) : String
      {
         var _loc2_:Array = null;
         if(param1 == -1 || param1 == PROFESSION_MASK_ANY)
         {
            return resourceManager.getString(BUNDLE,"FRM_LABEL_PROFESSION_ANY");
         }
         _loc2_ = [];
         if(param1 & PROFESSION_MASK_NONE)
         {
            _loc2_.push(resourceManager.getString(BUNDLE,"FRM_LABEL_PROFESSION_NONE"));
         }
         if(param1 & PROFESSION_MASK_DRUID)
         {
            _loc2_.push(resourceManager.getString(BUNDLE,"FRM_LABEL_PROFESSION_DRUID"));
         }
         if(param1 & PROFESSION_MASK_KNIGHT)
         {
            _loc2_.push(resourceManager.getString(BUNDLE,"FRM_LABEL_PROFESSION_KNIGHT"));
         }
         if(param1 & PROFESSION_MASK_PALADIN)
         {
            _loc2_.push(resourceManager.getString(BUNDLE,"FRM_LABEL_PROFESSION_PALADIN"));
         }
         if(param1 & PROFESSION_MASK_SORCERER)
         {
            _loc2_.push(resourceManager.getString(BUNDLE,"FRM_LABEL_PROFESSION_SORCERER"));
         }
         if(_loc2_.length > 0)
         {
            return _loc2_.join(", ");
         }
         return null;
      }
      
      private function onViewContextMenu(param1:MouseEvent) : void
      {
         new SpellListWidgetContextMenu(widgetInstance as SpellListWidget).display(this,param1.stageX,param1.stageY);
      }
      
      function get layoutMode() : int
      {
         return this.m_LayoutMode;
      }
   }
}