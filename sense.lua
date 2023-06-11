

senses= macro(500, "Sense Target", "shift+f", function()
if sense then 
say('sense "' .. sense )
end
end)



addIcon("Sense", {outfit={mount=849,feet=10,legs=10,body=178,type=75,auxType=0,addons=3,head=48}, text="Sense"},senses)


macro(1, function() if g_game.isAttacking() and g_game.getAttackingCreature():isPlayer() then sense = g_game.getAttackingCreature():getName() end end)