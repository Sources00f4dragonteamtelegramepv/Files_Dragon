local function ChangeUser(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local SOFI = DevSOFI:get("DraGoN:User"..result.id_)
if not result.username_ then 
if SOFI then 
Dev_SOFI(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..SOFI.."", 1, 'html')
DevSOFI:del("DraGoN:User"..result.id_) 
end
end
if result.username_ then 
if SOFI and SOFI ~= result.username_ then 
local SOFI_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لاينبعص، 😹♥️",
}
SOFIs = math.random(#SOFI_text)
Dev_SOFI(msg.chat_id_, msg.id_, 1, SOFI_text[SOFIs], 1, 'html')
end  
DevSOFI:set("DraGoN:User"..result.id_, result.username_) 
end
end
end,nil) 
end
end

end
return {
Dragon = ChangeUser
}