package tibia.creatures.statusWidgetClasses
{
   import tibia.game.ContextMenuBase;
   import tibia.creatures.StatusWidget;
   import mx.core.IUIComponent;
   import shared.utility.closure;
   import tibia.options.OptionsStorage;
   import flash.events.ContextMenuEvent;
   
   public class StatusWidgetContextMenu extends ContextMenuBase
   {
      
      protected static const PROFESSION_MASK_DRUID:int = 1 << PROFESSION_DRUID;
      
      protected static const STATE_PZ_BLOCK:int = 13;
      
      protected static const PROFESSION_SORCERER:int = 3;
      
      protected static const PK_REVENGE:int = 6;
      
      protected static const STATE_SLOW:int = 5;
      
      protected static const PARTY_NONE:int = 0;
      
      protected static const PARTY_MEMBER_SEXP_ACTIVE:int = 5;
      
      protected static const PROFESSION_MASK_SORCERER:int = 1 << PROFESSION_SORCERER;
      
      protected static const SKILL_FIGHTCLUB:int = 9;
      
      protected static const PK_PARTYMODE:int = 2;
      
      protected static const WAR_ALLY:int = 1;
      
      protected static const PROFESSION_MASK_NONE:int = 1 << PROFESSION_NONE;
      
      protected static const WAR_ENEMY:int = 2;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_GUILTY:int = 8;
      
      protected static const PARTY_MEMBER:int = 2;
      
      protected static const STATE_DRUNK:int = 3;
      
      protected static const WAR_NEUTRAL:int = 3;
      
      protected static const SKILL_EXPERIENCE:int = 0;
      
      protected static const TYPE_NPC:int = 2;
      
      protected static const PROFESSION_KNIGHT:int = 1;
      
      protected static const SKILL_STAMINA:int = 16;
      
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
      
      private static const BUNDLE:String = "StatusWidget";
      
      private static const SKILL_OPTIONS:Array = [SKILL_NONE,SKILL_LEVEL,SKILL_MAGLEVEL,SKILL_FIGHTAXE,SKILL_FIGHTCLUB,SKILL_FIGHTDISTANCE,SKILL_FIGHTFIST,SKILL_FIGHTSHIELD,SKILL_FIGHTSWORD,SKILL_FISHING];
      
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
      
      protected static const STATE_POISONED:int = 0;
      
      protected static const STATE_BURNING:int = 1;
      
      protected static const SKILL_FIGHTFIST:int = 12;
      
      protected static const STATE_DROWNING:int = 8;
      
      protected static const PK_AGGRESSOR:int = 3;
      
      protected static const SKILL_LEVEL:int = 1;
      
      protected static const STATE_STRENGTHENED:int = 12;
      
      protected static const STATE_HUNGRY:int = 31;
      
      protected static const PROFESSION_MASK_ANY:int = PROFESSION_MASK_DRUID | PROFESSION_MASK_KNIGHT | PROFESSION_MASK_PALADIN | PROFESSION_MASK_SORCERER;
      
      protected static const PROFESSION_DRUID:int = 4;
      
      protected static const PARTY_MEMBER_SEXP_OFF:int = 3;
      
      protected static const STATE_FIGHTING:int = 7;
      
      private static const STYLE_OPTIONS:Array = [StatusWidget.STATUS_STYLE_DEFAULT,StatusWidget.STATUS_STYLE_COMPACT,StatusWidget.STATUS_STYLE_PARALLEL,StatusWidget.STATUS_STYLE_FAT];
      
      protected static const SKILL_GOSTRENGTH:int = 5;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_INNOCENT:int = 9;
      
      protected static const PK_NONE:int = 0;
      
      protected static const PARTY_LEADER_SEXP_ACTIVE:int = 6;
       
      protected var m_Options:OptionsStorage = null;
      
      public function StatusWidgetContextMenu(param1:OptionsStorage)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("StatusWidgetContextMenu.StatusWidgetContextMenu: Invalid options reference.");
         }
         this.m_Options = param1;
      }
      
      override public function display(param1:IUIComponent, param2:Number, param3:Number) : void
      {
         var Label:String = null;
         var a_Owner:IUIComponent = param1;
         var a_StageX:Number = param2;
         var a_StageY:Number = param3;
         var i:int = 0;
         i = 0;
         while(i < STYLE_OPTIONS.length)
         {
            if(STYLE_OPTIONS[i] != this.m_Options.statusWidgetStyle)
            {
               createItem(resourceManager.getString(BUNDLE,"CTX_SWITCH_STYLE",[StatusWidget.s_GetStyleName(STYLE_OPTIONS[i])]),closure(null,function(param1:OptionsStorage, param2:int, param3:ContextMenuEvent):void
               {
                  if(param1 != null)
                  {
                     param1.statusWidgetStyle = param2;
                  }
               },this.m_Options,STYLE_OPTIONS[i]));
            }
            i++;
         }
         var NeedSeparator:Boolean = true;
         i = 0;
         while(i < SKILL_OPTIONS.length)
         {
            if(SKILL_OPTIONS[i] != this.m_Options.statusWidgetSkill)
            {
               Label = null;
               if(SKILL_OPTIONS[i] == SKILL_NONE)
               {
                  Label = resourceManager.getString(BUNDLE,"CTX_DISABLE_SKILL");
               }
               else
               {
                  Label = resourceManager.getString(BUNDLE,"CTX_SWITCH_SKILL",[StatusWidget.s_GetSkillName(SKILL_OPTIONS[i])]);
               }
               createItem(Label,closure(null,function(param1:OptionsStorage, param2:int, param3:ContextMenuEvent):void
               {
                  if(param1)
                  {
                     param1.statusWidgetSkill = param2;
                  }
               },this.m_Options,SKILL_OPTIONS[i]),NeedSeparator);
               NeedSeparator = false;
            }
            i++;
         }
         super.display(a_Owner,a_StageX,a_StageY);
      }
   }
}