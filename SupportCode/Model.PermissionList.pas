unit Model.PermissionList;

interface
type
  TPerm = record
    Id : Integer;
    Name : string;
    Parent : Integer;
  end;
const
  arrPerms : Array[1..101] of TPerm =
  ((Id:100; Name:'All authorization parameters'; Parent:0),
   (Id:101; Name:'User all ops'; Parent:100),
   (Id:102; Name:'User add'; Parent:101),
   (Id:103; Name:'User edit'; Parent:101),
   (Id:104; Name:'User delete'; Parent:101),
   (Id:105; Name:'User view'; Parent:101),
   (Id:107; Name:'User group ops'; Parent:101),
   (Id:111; Name:'Group all ops'; Parent:100),
   (Id:112; Name:'Group add'; Parent:111),
   (Id:113; Name:'Group edit'; Parent:111),
   (Id:114; Name:'Group delete'; Parent:111),
   (Id:115; Name:'Group view'; Parent:111),
   (Id:121; Name:'Role all ops'; Parent:100),
   (Id:122; Name:'Role add'; Parent:121),
   (Id:123; Name:'Role edit'; Parent:121),
   (Id:124; Name:'Role delete'; Parent:121),
   (Id:125; Name:'Role view'; Parent:121),
   (Id:131; Name:'Permission all ops'; Parent:100),
   (Id:132; Name:'Permission add'; Parent:131),
   (Id:133; Name:'Permission edit'; Parent:131),
   (Id:134; Name:'Permission delete'; Parent:131),
   (Id:135; Name:'Permission view'; Parent:131),
   (Id:140; Name:'All authorization assignments'; Parent:100),
   (Id:141; Name:'Group-User assignments'; Parent:140),
   (Id:142; Name:'Role-User-Group assignments'; Parent:140),
   (Id:143; Name:'Role-User-Group-Permission assignments'; Parent:140),

   (Id:3000; Name:'General parameters'; Parent:100),
   (Id:3001; Name:'Country all ops'; Parent:3000),
   (Id:3002; Name:'Country add'; Parent:3001),
   (Id:3003; Name:'Country edit'; Parent:3001),
   (Id:3004; Name:'Country delete'; Parent:3001),
   (Id:3005; Name:'Country view'; Parent:3001),
   (Id:3011; Name:'City all ops'; Parent:3000),
   (Id:3012; Name:'City add'; Parent:3011),
   (Id:3013; Name:'City edit'; Parent:3011),
   (Id:3014; Name:'City delete'; Parent:3011),
   (Id:3015; Name:'City view'; Parent:3011),
   (Id:3021; Name:'Town all ops'; Parent:3000),
   (Id:3022; Name:'Town add'; Parent:3021),
   (Id:3023; Name:'Town edit'; Parent:3021),
   (Id:3024; Name:'Town delete'; Parent:3021),
   (Id:3025; Name:'Town view'; Parent:3021),
   (Id:3031; Name:'Location all ops'; Parent:3000),
   (Id:3032; Name:'Location add'; Parent:3031),
   (Id:3033; Name:'Location edit'; Parent:3031),
   (Id:3034; Name:'Location delete'; Parent:3031),
   (Id:3035; Name:'Location view'; Parent:3031),
   (Id:3041; Name:'Language all ops'; Parent:3000),
   (Id:3042; Name:'Language add'; Parent:3041),
   (Id:3043; Name:'Language edit'; Parent:3041),
   (Id:3044; Name:'Language delete'; Parent:3041),
   (Id:3045; Name:'Language view'; Parent:3041),

   (Id:3051; Name:'Relationship Type all ops'; Parent:3000),
   (Id:3052; Name:'Relationship Type add'; Parent:3051),
   (Id:3053; Name:'Relationship Type edit'; Parent:3051),
   (Id:3054; Name:'Relationship Type delete'; Parent:3051),
   (Id:3055; Name:'Relationship Type view'; Parent:3051),

   (Id:3500; Name:'Company Parameters'; Parent:100),
   (Id:3501; Name:'Company all ops'; Parent:3500),
   (Id:3502; Name:'Company add'; Parent:3501),
   (Id:3503; Name:'Company edit'; Parent:3501),
   (Id:3504; Name:'Company delete'; Parent:3501),
   (Id:3505; Name:'Company view'; Parent:3501),

   (Id:3511; Name:'Department all ops'; Parent:3500),
   (Id:3512; Name:'Department add'; Parent:3511),
   (Id:3513; Name:'Department edit'; Parent:3511),
   (Id:3514; Name:'Department delete'; Parent:3511),
   (Id:3515; Name:'Department view'; Parent:3511),

   (Id:3521; Name:'Title all ops'; Parent:3500),
   (Id:3522; Name:'Title add'; Parent:3521),
   (Id:3523; Name:'Title edit'; Parent:3521),
   (Id:3524; Name:'Title delete'; Parent:3521),
   (Id:3525; Name:'Title view'; Parent:3521),

   (Id:3531; Name:'Bank all ops'; Parent:3500),
   (Id:3532; Name:'Bank add'; Parent:3531),
   (Id:3533; Name:'Bank edit'; Parent:3531),
   (Id:3534; Name:'Bank delete'; Parent:3531),
   (Id:3535; Name:'Bank view'; Parent:3531),

   (Id:3541; Name:'Other Income&Cut all ops'; Parent:3500),
   (Id:3542; Name:'Other Income&Cut add'; Parent:3541),
   (Id:3543; Name:'Other Income&Cut edit'; Parent:3541),
   (Id:3544; Name:'Other Income&Cut delete'; Parent:3541),
   (Id:3545; Name:'Other Income&Cut view'; Parent:3541),

   (Id:3900; Name:'All currency processes'; Parent:100),
   (Id:3901; Name:'Currency all ops'; Parent:3900),
   (Id:3902; Name:'Currency add'; Parent:3901),
   (Id:3903; Name:'Currency edit'; Parent:3901),
   (Id:3904; Name:'Currency delete'; Parent:3901),
   (Id:3905; Name:'Currency view'; Parent:3901),
   (Id:3911; Name:'Currency daily all ops'; Parent:3900),
   (Id:3913; Name:'Currency daily edit'; Parent:3911),
   (Id:3914; Name:'Currency daily get values from internet'; Parent:3911),
   (Id:3915; Name:'Currency daily view'; Parent:3911),
   (Id:3916; Name:'Currency daily options to get from internet'; Parent:3911),

   (Id:5000; Name:'Employee&Payroll system'; Parent:100),
   (Id:5011; Name:'Employee all ops'; Parent:5000),
   (Id:5012; Name:'Employee add'; Parent:5011),
   (Id:5013; Name:'Employee edit'; Parent:5011),
   (Id:5014; Name:'Employee delete'; Parent:5011),
   (Id:5015; Name:'Employee view'; Parent:5011),
   (Id:10000; Name:'All parameter operations'; Parent:0));


implementation

end.

