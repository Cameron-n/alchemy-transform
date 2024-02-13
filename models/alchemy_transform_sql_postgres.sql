select t1.ingredients as t1ing,t2.ingredients as t2ing,
t1.`effect 1` as t1e1, t1.`effect 2` as t1e2, t1.`effect 3` as t1e3, t1.`effect 4` as t1e4,
t2.`effect 1` as t2e1, t2.`effect 2` as t2e2, t2.`effect 3` as t2e3, t2.`effect 4` as t2e4,
(
   (t1.`effect 1` in (t2.`effect 1`,t2.`effect 2`,t2.`effect 3`,t2.`effect 4`) and t1.`effect 1` != '')
+ (t1.`effect 2` in (t2.`effect 1`,t2.`effect 2`,t2.`effect 3`,t2.`effect 4`) and t1.`effect 2` != '')
+ (t1.`effect 3` in (t2.`effect 1`,t2.`effect 2`,t2.`effect 3`,t2.`effect 4`) and t1.`effect 3` != '')
+ (t1.`effect 4` in (t2.`effect 1`,t2.`effect 2`,t2.`effect 3`,t2.`effect 4`) and t1.`effect 4` != '')
) as number_of_effects
from -- Probably works
(
ingredients_final t1, ingredients_final t2
)
where t1.ingredients < t2.ingredients
and (
   t1.`effect 1` in (t2.`effect 1`,t2.`effect 2`,t2.`effect 3`,t2.`effect 4`) and t1.`effect 1` != ''
or t1.`effect 2` in (t2.`effect 1`,t2.`effect 2`,t2.`effect 3`,t2.`effect 4`) and t1.`effect 2` != ''
or t1.`effect 3` in (t2.`effect 1`,t2.`effect 2`,t2.`effect 3`,t2.`effect 4`) and t1.`effect 3` != ''
or t1.`effect 4` in (t2.`effect 1`,t2.`effect 2`,t2.`effect 3`,t2.`effect 4`) and t1.`effect 4` != ''
) 
