; #FUNCTION# ====================================================================================================================
; Name ..........: SwitchCocAcc
; Description ...: Switching COC accounts to play
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: chalicucu
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func SwitchCOCAcc($FirstSwitch = False)     ;change COC account 
	If $FirstSwitch Then SetLog("First matching account and profile", $COLOR_GREEN);
	SetLog("Ordered COC account: " & AccGetOrder() & " (" & AccGetStep() & ")", $COLOR_GREEN);
	SetLog("Ordered bot profile: " & ProGetOrderName(), $COLOR_GREEN);
	SetLog("Switching Mode: " & $iSwitchMode & " - " & GUICtrlRead($cmbSwitchMode), $COLOR_GREEN)
	;if $nCurCOCAcc = $anCOCAccIdx[$nCurCOCAcc - 1] And Not $FirstStart Then		;Loopping 1 account, disable switching
	Local $lnNextStep = 0
	Local $nPreCOCAcc = $nCurCOCAcc
	If $iSwitchMode = 0 And $iSwitchCnt >= $CoCAccNo Then
		If ($accAttack[0] <>  -1 And ($iSwitchCnt < $CoCAccNo + Ubound($accAttack))) Or ($accDonate[0] = -1) Then
			$lnNextStep = GetMinTrain()
			if $nCurCOCAcc = $accAttack[$lnNextStep] And Not $FirstStart Then		;Loopping 1 account
				SetLog("1. Target account is current one. Nothing to do..", $COLOR_GREEN)
				$iGoldLast = ""
				$iElixirLast = ""
				$iSwitchCnt += 1
				If _Sleep(1000) Then Return False
				Return False
			EndIf
			$nCurCOCAcc = $accAttack[$lnNextStep]     ;target attack account
			SetLog("Account " & $nCurCOCAcc & " has shortest training time now")
		Else
			$nCurCOCAcc = GetNextDonAcc();	$accDonate[0]				;target donate account
			SetLog("Account " & $nCurCOCAcc & " for donation")
		EndIf
	ElseIf $iSwitchMode = 2 Then ; random switch
		$nCurCOCAcc = GetRandomAcc()
		SetLog("Randomized to Account " & $nCurCOCAcc)
	Else
		$lnNextStep = AccGetNext()
		if $nCurCOCAcc = $anCOCAccIdx[$lnNextStep] And Not $FirstStart Then		;Loopping 1 account, disable switching
			SetLog("Target account is current one. Nothing to do..", $COLOR_GREEN)
			$nCurStep = $lnNextStep		;but still move to next step
			$iGoldLast = ""
			$iElixirLast = ""
