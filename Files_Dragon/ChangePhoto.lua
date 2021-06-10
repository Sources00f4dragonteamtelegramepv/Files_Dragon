local function ChangePhoto(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local SOFI = DevSOFI:get("DraGoN:Photo"..result.id_)
if not result.profile_photo_ then 
if SOFI then 
Dev_SOFI(msg.chat_id_, msg.id_, 1, "حذف كل صوره مضروب بوري، 😹💔", 1, 'html')
DevSOFI:del("DraGoN:Photo"..result.id_) 
end
end
if result.profile_photo_ then 
if SOFI and SOFI ~= result.profile_photo_.big_.persistent_id_ then 
local SOFI_text = {
"وفف مو صوره غنبلةة، 🤤♥️",
"طالع صاكك بالصوره الجديده ممكن نرتبط؟ ، 🤤♥️",
"حطيت صوره جديده عود شوفوني اني صاكك بنات، 😹♥️",
"اححح شنيي هالصوره الجديده، 🤤♥️",
}
SOFI3 = math.random(#SOFI_text)
Dev_SOFI(msg.chat_id_, msg.id_, 1, SOFI_text[SOFI3], 1, 'html')
end  
DevSOFI:set("DraGoN:Photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end,nil) 
end
end

end
return {
Dragon = ChangePhoto
}