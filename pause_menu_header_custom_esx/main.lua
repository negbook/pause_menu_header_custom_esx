ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	CreateThread(function()
        while true do
            
            ESX.TriggerServerCallback('pause_menu_header_custom_esx:getinfo', function(infos)
                if infos then 
                    SetHeadingDetailsCustom("("..infos.id ..")".. infos.name,"Job:"..infos.job.label,"Cash: "..infos.money.." Bank: "..infos.bank.." BlackMoney: "..infos.blackmoney)
                    
                    SetHeaderTitle("Something V","Classic RolePlay")
                
                end 
            end)
            Wait(1000)
        end 
    end )

end)




local isScripted = true 
function SetHeadingDetailsCustom(str1, str2, str3)
    BeginScaleformMovieMethodOnFrontendHeader("SET_HEADING_DETAILS")
     ScaleformMovieMethodAddParamTextureNameString(str1)
     ScaleformMovieMethodAddParamTextureNameString(str2)
     ScaleformMovieMethodAddParamTextureNameString(str3)
     ScaleformMovieMethodAddParamBool(false)
     ScaleformMovieMethodAddParamBool(isScripted)
    EndScaleformMovieMethod()

end 

function ShiftCoronaDesc(shiftDesc, hideTabs)
    BeginScaleformMovieMethodOnFrontendHeader("SHIFT_CORONA_DESC")
    ScaleformMovieMethodAddParamBool(shiftDesc)
    ScaleformMovieMethodAddParamBool(hideTabs)
    EndScaleformMovieMethod()
end 

function SetHeaderTitle(title_, description_)
    local title = title_ and "<font face='$Font2_cond_NOT_GAMERNAME'>"..title_.."</font>" or ""
    local description = description_ and "<font face='$Font2'>".. description_ .."</font>" or ""
 
    BeginScaleformMovieMethodOnFrontendHeader("SET_HEADER_TITLE")
    ScaleformMovieMethodAddParamTextureNameString(title)
    ScaleformMovieMethodAddParamBool(false)
    ScaleformMovieMethodAddParamTextureNameString(description)
    ScaleformMovieMethodAddParamBool(false)
    ScaleformMovieMethodAddParamBool(isScripted)
    EndScaleformMovieMethod()
    if description and string.len(description) > 0 then 
        ShiftCoronaDesc(true,false)
    else 
        ShiftCoronaDesc(false,false)
    end 
    
end 



function LockMenu(menuindex, isLocked)
    BeginScaleformMovieMethodOnFrontendHeader("LOCK_MENU_ITEM")
    ScaleformMovieMethodAddParamInt(menuindex)
    ScaleformMovieMethodAddParamBool(isLocked)
    EndScaleformMovieMethod()
end 

function SetMenuAlert(menuindex, warnStr_)
    local warnStr = warnStr_ and "<font face='$Font2_cond_NOT_GAMERNAME'>"..warnStr_.."</font>" or ""
    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")
    ScaleformMovieMethodAddParamInt(menuindex)
    ScaleformMovieMethodAddParamTextureNameString(warnStr)
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()
end
function SetMenuHeaderTextByIndex(menuIndex, label, widthSpan)
    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")
    ScaleformMovieMethodAddParamInt(menuindex)
    ScaleformMovieMethodAddParamTextureNameString(label)
    ScaleformMovieMethodAddParamBool(widthSpan)
    EndScaleformMovieMethod()
end


