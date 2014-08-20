function fnParadigmTargetDetectionGUI() 
%
% Copyright (c) 2008 Shay Ohayon, California Institute of Technology.
% This file is a part of a free software. you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation (see GPL.txt)

global g_strctParadigm   
    
[hParadigmPanel, iPanelHeight, iPanelWidth] = fnCreateParadigmPanel();
strctControllers.m_hPanel = hParadigmPanel;
strctControllers.m_iPanelHeight = iPanelHeight;
strctControllers.m_iPanelWidth = iPanelWidth;

strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 40+30*0, ...
     'Juice Pulse (ms):', 'JuiceTimeMS',  0, 100, [1 5], fnTsGetVar(g_strctParadigm,'JuiceTimeMS'));

 strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 60+30*2, ...
     'ITI minimum (sec):', 'InterTrialIntervalMinSec',  0, 60, [1 5], fnTsGetVar(g_strctParadigm,'InterTrialIntervalMinSec'));
strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 60+30*3, ...
     'ITI maximum (sec):', 'InterTrialIntervalMaxSec',  0, 60, [1 5], fnTsGetVar(g_strctParadigm,'InterTrialIntervalMaxSec'));

strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 60+30*4, ...
     'Hold To Start(ms):', 'HoldFixationToStartTrialMS',  0, 100, [1 5], fnTsGetVar(g_strctParadigm,'HoldFixationToStartTrialMS'));

strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 60+30*5, ...
     'Hold At Target(ms):', 'HoldFixationAtTargetMS',  0, 100, [1 5], fnTsGetVar(g_strctParadigm,'HoldFixationAtTargetMS'));

 strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 60+30*6, ...
     'Trial Timeout (ms):', 'TimeoutMS',  0, 4000, [1 5], fnTsGetVar(g_strctParadigm,'TimeoutMS'));

  strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 60+30*7, ...
     'Incorrect Delay (ms):', 'IncorrectTrialDelayMS',  0, 2000, [1 5], fnTsGetVar(g_strctParadigm,'IncorrectTrialDelayMS'));

   strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 60+30*8, ...
     'Persist Objects (ms):', 'ShowObjectsAfterSaccadeMS',  0, 3000, [1 5], fnTsGetVar(g_strctParadigm,'ShowObjectsAfterSaccadeMS'));

 strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 80+30*9, ...
     'Fixation Radius (pix):', 'FixationRadiusPix',  0, 100, [1 5], fnTsGetVar(g_strctParadigm,'FixationRadiusPix'));
strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 80+30*10, ...
     'Target Hit Radius (pix):', 'HitRadius',  0, 100, [1 5], fnTsGetVar(g_strctParadigm,'HitRadius'));
  
strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 80+30*11, ...
     'Object Size (pix):', 'ObjectHalfSizePix',  0, 100, [1 5], fnTsGetVar(g_strctParadigm,'ObjectHalfSizePix'));

strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 80+30*12, ...
     'Object Separation (pix):', 'ObjectSeparationPix',  0, 100, [1 5], fnTsGetVar(g_strctParadigm,'ObjectSeparationPix'));
 
 
 
 
 
 
strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 80+30*13, ...
     'Num Targets :', 'NumTargets',  0, 100, [1 5], fnTsGetVar(g_strctParadigm,'NumTargets'));
strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 80+30*14, ...
     'Num Non Targets:', 'NumNonTargets',  0, 100, [1 5], fnTsGetVar(g_strctParadigm,'NumNonTargets'));

strctControllers.m_hLoadList = uicontrol('Parent',hParadigmPanel,'Style', 'pushbutton', 'String', 'Load Object List',...
     'Position', [5 iPanelHeight-80 130 30], 'Callback', [g_strctParadigm.m_strCallbacks,'(''LoadList'');']);
 
 
strctControllers.m_hResetStat = uicontrol('Parent',hParadigmPanel,'Style', 'pushbutton', 'String', 'Reset Stat',...
     'Position', [155 iPanelHeight-80 130 30], 'Callback', [g_strctParadigm.m_strCallbacks,'(''ResetStat'');']);

 
 
strctControllers = fnAddTextSliderEditComboSmallWithCallback(strctControllers, 80+30*17, ...
     'MicroStim Offset(MS) :', 'StimulationOffsetMS',  -200, 200, [1 5], fnTsGetVar(g_strctParadigm,'StimulationOffsetMS'));

 strctControllers.m_hExternalStimulation = uicontrol('Style','checkbox','String','Micro Stimulation',...
     'Position',[10 140 200 15],'HorizontalAlignment','Left','Parent',...
    hParadigmPanel,'Callback',[g_strctParadigm.m_strCallbacks,'(''ToggleMicroStim'');'],'value',...
      fnTsGetVar(g_strctParadigm,'StimulationON'),'ForegroundColor','k','FontWeight','normal');

  
 strctControllers.m_hResponsePrediction = uicontrol('Style','checkbox','String','Response Prediction',...
     'Position',[10 120 200 15],'HorizontalAlignment','Left','Parent',...
    hParadigmPanel,'Callback',[g_strctParadigm.m_strCallbacks,'(''TogglePrediction'');'],'value',...
      g_strctParadigm.m_bPredictionON );
  
  
 strctControllers.m_hMouseEmulator = uicontrol('Style','checkbox','String','Mouse Emulator',...
     'Position',[10 100 200 15],'HorizontalAlignment','Left','Parent',...
    hParadigmPanel,'Callback',[g_strctParadigm.m_strCallbacks,'(''ToggleEmulator'');'],'value',...
      g_strctParadigm.m_bEmulatorON );

 strctControllers.m_hExtinguish = uicontrol('Style','checkbox','String','Extinguish Objects After Saccade',...
     'Position',[10 80 200 15],'HorizontalAlignment','Left','Parent',...
    hParadigmPanel,'Callback',[g_strctParadigm.m_strCallbacks,'(''ToggleExtinguish'');'],'value',...
      g_strctParadigm.m_bExtinguishObjectsAfterSaccade );

 
 strctControllers.m_hJuicePulses = uicontrol('Style','checkbox','String','Juice Pulses',...
     'Position',[10 60 140 15],'HorizontalAlignment','Left','Parent',...
    hParadigmPanel,'Callback',[g_strctParadigm.m_strCallbacks,'(''ToggleJuicePulses'');'],'value',...
      g_strctParadigm.m_bJuicePulses );
 
  strctControllers.m_hFavroiteLists = uicontrol('Style', 'listbox', 'String', fnCellToCharShort(g_strctParadigm.m_acFavroiteLists),...
    'Position', [strctControllers.m_iPanelWidth-180 10 170 100], 'parent',hParadigmPanel, 'Callback',[g_strctParadigm.m_strCallbacks,'(''LoadFavoriteList'');'],...
    'value',max(1,g_strctParadigm.m_iInitialIndexInFavroiteList));


g_strctParadigm.m_strctControllers = strctControllers;
return;