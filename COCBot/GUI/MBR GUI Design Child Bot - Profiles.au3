; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Global $txtPresetSaveFilename, $txtSavePresetMessage, $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf
Global $cmbPresetList, $txtPresetMessage,$btnGUIPresetLoadConf,  $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf

;$hGUI_Profiles = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_BOT)
;GUISwitch($hGUI_Profiles)

Local $x = 25, $y = 45
	$grpProfiles = GUICtrlCreateGroup(GetTranslated(637,1, "Switch Profiles"), $x - 20, $y - 20, 440, 360)
		;$y -= 5
		$x -= 5
		;$lblProfile = GUICtrlCreateLabel(GetTranslated(7,27, "Current Profile") & ":", $x, $y, -1, -1)
		;$y += 15
		$cmbProfile = GUICtrlCreateCombo("", $x - 3, $y + 1, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(637,2, "Use this to switch to a different profile")& @CRLF & GetTranslated(637,3, "Your profiles can be found in") & ": " & @CRLF & $sProfilePath
			_GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox()
			PopulatePresetComboBox()
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetOnEvent(-1, "cmbProfile")
		$txtVillageName = GUICtrlCreateInput(GetTranslated(637,4, "MyVillage"), $x - 3, $y, 130, 22, $ES_AUTOHSCROLL)
			GUICtrlSetLimit (-1, 100, 0)
			GUICtrlSetFont(-1, 9, 400, 1)
			_GUICtrlSetTip(-1, GetTranslated(637,5, "Your village/profile's name"))
			GUICtrlSetState(-1, $GUI_HIDE)
			; GUICtrlSetOnEvent(-1, "txtVillageName") - No longer needed

		$bIconAdd = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_4.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
		$bIconConfirm = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_4.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
		$bIconDelete = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_4.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
		$bIconCancel = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_4.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
		$bIconEdit = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_4.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")

		$btnAdd = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnAdd, $bIconAdd, 4)
			GUICtrlSetOnEvent(-1, "btnAddConfirm")
			GUICtrlSetState(-1, $GUI_SHOW)
			_GUICtrlSetTip(-1, GetTranslated(637,6, "Add New Profile"))
		$btnConfirmAdd = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnConfirmAdd, $bIconConfirm, 4)
			GUICtrlSetOnEvent(-1, "btnAddConfirm")
			GUICtrlSetState(-1, $GUI_HIDE)
			_GUICtrlSetTip(-1, GetTranslated(637,7, "Confirm"))
		$btnConfirmRename = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnConfirmRename, $bIconConfirm, 4)
			GUICtrlSetOnEvent(-1, "btnRenameConfirm")
			GUICtrlSetState(-1, $GUI_HIDE)
			_GUICtrlSetTip(-1, GetTranslated(637,7, -1))
		$btnDelete = GUICtrlCreateButton("", $x + 164, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnDelete, $bIconDelete, 4)
			GUICtrlSetOnEvent(-1, "btnDeleteCancel")
			GUICtrlSetState(-1, $GUI_SHOW)
			_GUICtrlSetTip(-1, GetTranslated(637,8, "Delete Profile"))
		$btnCancel = GUICtrlCreateButton("", $x + 164, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnCancel, $bIconCancel, 4)
			GUICtrlSetOnEvent(-1, "btnDeleteCancel")
			GUICtrlSetState(-1, $GUI_HIDE)
			_GUICtrlSetTip(-1, GetTranslated(637,9, "Cancel"))
		$btnRename = GUICtrlCreateButton("", $x + 194, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnRename, $bIconEdit, 4)
			GUICtrlSetOnEvent(-1, "btnRenameConfirm")
			_GUICtrlSetTip(-1, GetTranslated(637,10, "Rename Profile"))		
		; Chalicucu & demen: switch CoC Acc GUI
		GUICtrlCreateGroup(GetTranslated(636,2, "Switch CoC Accounts"), $x - 10, $y + 40, 250, 280)
			$y += 60
			
			$chkSwitchAcc = GUICtrlCreateCheckbox("Enable Switch Account", $x, $y, -1, -1)
			$txtTip = "Switch to another account & profile when remain train time >=3 minutes" & @CRLF & _
			          "This function supports maximum 8 CoC accounts & 9 Bot profiles" & @CRLF & _
			          "Make sure to align the accounts with profiles in listing order"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSwitchAcc")
			;GUICtrlSetState(-1, $GUI_CHECKED)
			
			$y += 30
			GUICtrlCreateLabel("Switching Mode", $x, $y, 130, 20)
			$cmbSwitchMode = GUICtrlCreateCombo("", $x + 140, $y - 2, 90, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "Choose switching mode for play list")
			GUICtrlSetData(-1, "Shortest Training" & "|" & "Ordered play list" & "|" & "Random")
			GUICtrlSetOnEvent(-1, "cmbSwitchMode")
			GUICtrlSetState (-1, $GUI_ENABLE)
			
			$y += 30
			$lbTotalCoCAcc = GUICtrlCreateLabel("Total CoC Accounts", $x , $y, 130, 20)
			$txtTotalCoCAcc = GUICtrlCreateInput("0", $x + 140 , $y - 2, 70, 20,  BitOR($SS_LEFT, $ES_AUTOHSCROLL))
			GUICtrlSetLimit(-1, 1)
			GUICtrlSetTip(-1,"Number of Google Accounts on emulator. Supporting maximum 8 Accounts.")
			
			$y += 30
			$lbAccBottingOrder = GUICtrlCreateLabel("Accounts Playing List", $x , $y, 130, 20)
			$txtAccBottingOrder = GUICtrlCreateInput("12345678", $x + 140 , $y - 2, 70, 20,  BitOR($SS_LEFT, $ES_AUTOHSCROLL))
			;GUICtrlSetLimit(-1, 8)
			GUICtrlSetTip(-1,"Input group of accounts you want to play.")
			
			$y += 30
			$lbProfileIdxOrder = GUICtrlCreateLabel("Mapping Profile Indexs", $x , $y, 130, 20)
			$txtProfileIdxOrder = GUICtrlCreateInput("12345678", $x + 140 , $y - 2, 70, 20,  BitOR($SS_LEFT, $ES_AUTOHSCROLL))
			GUICtrlSetLimit(-1, 8)
			GUICtrlSetTip(-1,"Input the order of Profiles correspond to CoC Accounts order.")
			
			$y += 30
			$chkAccRelax = GUICtrlCreateCheckbox("Attack relax together", $x, $y, -1, -1)
			$txtTip = "If attack is not planned for current profile" & @CRLF & _
			          "Then bot stop emulator and relax"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkAccRelaxTogether")
			;GUICtrlSetState(-1, $GUI_CHECKED)
			
			$y += 30
			$chkAtkPln = GUICtrlCreateCheckbox("Check attack plan", $x, $y, -1, -1)
			$txtTip = "Enable/Disable attack plan"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkAtkPln")
			GUICtrlSetState(-1, $GUI_CHECKED)
			
			$y += 25
			GUICtrlCreateLabel("Mapped Acc - Profile:", $x , $y, 130, 20)
			GUICtrlSetColor(-1, $COLOR_BLUE)
			$y += 15
			$lbMapHelp = GUICtrlCreateLabel("", $x , $y, 230, 30)
			GUICtrlSetColor(-1, $COLOR_BLUE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
;GUISetState()
