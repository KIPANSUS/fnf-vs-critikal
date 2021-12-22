function onCreate()

	makeAnimatedLuaSprite('bg', 'bg', -400,-250)
	addAnimationByPrefix('bg','bg','bg',24,true)
	addLuaSprite('bg',false)
	objectPlayAnimation('bg','bg',false)
	setScrollFactor('bg', 1.2, 1.2);
	scaleObject('bg', 2, 2);

	makeLuaSprite('alternate_versions', 'alternate_versions', -650, -430);
	addLuaSprite('alternate_versions',false)


	makeLuaSprite('critical', 'critical', -650, -430);
	addLuaSprite('critical',false)

	makeLuaSprite('text', 'text', -650, -430);
	addLuaSprite('text',true)

	setObjectCamera('text' , 'camother')


	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	end
end


function onBeatHit()
	if curBeat < 388 then

		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		setProperty('camHUD.angle',angleshit*3)
		setProperty('camGame.angle',angleshit*3)
		doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
		doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
	else
		setProperty('camHUD.angle',0)
		setProperty('camHUD.x',0)
		setProperty('camHUD.x',0)
	end
		
end

function onStepHit()
	if curBeat < 388 then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -5, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end
end

function onUpdate()
	if curStep == 0 then
		triggerEvent('Camera Follow Pos','680','400')
       setProperty('defaultCamZoom', 0.7)
   end
        if mustHitSection == false then

            if getProperty('dad.animation.curAnim.name') == 'singUP' then

            	triggerEvent('Screen Shake','0.1,0.008','')
            	triggerEvent('Add Camera Zoom','0.001','0')

            end

	end
if curStep == 0 then
        started = true
    end
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)

doTweenY('opponentmove', 'alternate_versions', -400 - 100*math.sin((currentBeat+12*12)*math.pi), 2)

doTweenX('alternate-versions', 'alternate-versions.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)

doTweenY('alternate-versions', 'alternate-versions.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)

end