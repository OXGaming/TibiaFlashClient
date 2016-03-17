package tibia.sessiondump.hints.condition
{
   import shared.utility.Vector3D;
   import avmplus.getQualifiedClassName;
   
   public class HintConditionBase
   {
      
      private static var FIELD_CONDITIONDATA:String = "conditiondata";
      
      private static var FIELD_COORDINATE:String = "coordinate";
      
      private static var FIELD_SESSIONDUMP:String = "sessiondump";
      
      private static var FIELD_DESTINATION_COORDINATE:String = "destination";
      
      private static var FIELD_CHANNEL:String = "channel";
      
      private static var FIELD_TYPE:String = "type";
      
      private static var FIELD_CONDITIONTYPE:String = "conditiontype";
      
      private static var FIELD_USE_TYPE_ID:String = "usetypeid";
      
      private static var FIELD_PLAYER_OUTFIT_COLOR_TORSO:String = "color-torso";
      
      private static var FIELD_OBJECTTYPE:String = "objecttype";
      
      private static var CONDITION_TYPE_CLICK_CREATURE:String = "CLICK_CREATURE";
      
      private static var FIELD_OBJECTTYPEID:String = "objecttypeid";
      
      private static var FIELD_POSITION:String = "position";
      
      private static var FIELD_TARGET:String = "target";
      
      private static var FIELD_PLAYER_OUTFIT:String = "player-outfit";
      
      private static var FIELD_UIELEMENT:String = "uielement";
      
      private static var FIELD_PLAYER_OUTFIT_COLOR_DETAIL:String = "color-detail";
      
      private static var FIELD_MULTIUSE_TARGET:String = "multiusetarget";
      
      private static var FIELD_CHANNEL_ID:String = "channelid";
      
      private static var FIELD_CREATURE_ID:String = "creatureid";
      
      private static var CONDITION_TYPE_DRAG_DROP:String = "DRAG_DROP";
      
      private static var FIELD_MULTIUSE_OBJECT_POSITION:String = "multiuseobjectposition";
      
      private static var FIELD_PLAYER_NAME:String = "player-name";
      
      private static var FIELD_PLAYER_OUTFIT_ID:String = "id";
      
      private static var FIELD_PLAYER_OUTFIT_COLOR_LEGS:String = "color-legs";
      
      private static var FIELD_SKIP_TO_TIMESTAMP:String = "skiptotimestamp";
      
      private static var FIELD_MULTIUSE_OBJECT_ID:String = "multiuseobjectid";
      
      private static var FIELD_TUTORIAL_PROGRESS:String = "tutorialprogress";
      
      private static var FIELD_TIMESTAMP:String = "timestamp";
      
      private static var FIELD_PLAYER_OUTFIT_ADDONS:String = "add-ons";
      
      private static var FIELD_AMOUNT:String = "amount";
      
      private static var FIELD_OBJECTID:String = "objectid";
      
      private static var FIELD_CREATURE_NAME:String = "creaturename";
      
      private static var CONDITION_TYPE_CLICK:String = "CLICK";
      
      private static var FIELD_OBJECTDATA:String = "objectdata";
      
      private static var FIELD_TEXT:String = "text";
      
      private static var FIELD_OBJECTINDEX:String = "objectindex";
      
      private static var FIELD_SOURCE_COORDINATE:String = "source";
      
      private static var FIELD_PLAYER_OUTFIT_COLOR_HEAD:String = "color-head";
       
      protected var m_Type:String = null;
      
      public function HintConditionBase()
      {
         super();
      }
      
      public static function s_Unmarshall(param1:Object) : HintConditionBase
      {
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc2_:HintConditionBase = null;
         if(FIELD_CONDITIONDATA in param1)
         {
            _loc3_ = String(param1[FIELD_CONDITIONTYPE]);
            _loc4_ = param1[FIELD_CONDITIONDATA] as Object;
            switch(_loc3_)
            {
               case HintConditionAutowalk.TYPE:
                  _loc2_ = HintConditionAutowalk.s_Unmarshall(_loc4_);
                  break;
               case HintConditionMove.TYPE:
                  _loc2_ = HintConditionMove.s_Unmarshall(_loc4_);
                  break;
               case HintConditionAttack.TYPE:
                  _loc2_ = HintConditionAttack.s_Unmarshall(_loc4_);
                  break;
               case HintConditionGreet.TYPE:
                  _loc2_ = HintConditionGreet.s_Unmarshall(_loc4_);
                  break;
               case HintConditionTalk.TYPE:
                  _loc2_ = HintConditionTalk.s_Unmarshall(_loc4_);
                  break;
               case HintConditionUse.TYPE:
                  _loc2_ = HintConditionUse.s_Unmarshall(_loc4_);
            }
         }
         else
         {
            _loc2_ = new HintConditionBase();
         }
         return _loc2_;
      }
      
      public static function s_UnmarshallCoordinate(param1:Object) : Vector3D
      {
         if(param1 == null || "x" in param1 == false || "y" in param1 == false || "z" in param1 == false)
         {
            throw new ArgumentError("SessiondumpHintBase.s_UnmarshallCoordinate: Invalid coordinate object");
         }
         return new Vector3D(param1["x"],param1["y"],param1["z"]);
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this);
      }
   }
}