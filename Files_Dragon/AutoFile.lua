local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_SOFI(msg.chat_id_,msg.id_, 1, "⌯︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌯︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevSOFI:del(Dragon.."SOFI:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_SOFI(msg.chat_id_,msg.id_, 1, "⌯︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevSOFI:set(Dragon.."SOFI:Lock:AutoFile",true) 
end 
end

if (text and not DevSOFI:get(Dragon.."SOFI:Lock:AutoFile")) then
Time = DevSOFI:get(Dragon.."SOFI:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevSOFI:smembers(Dragon..'SOFI:Groups') 
local BotName = (DevSOFI:get(Dragon.."SOFI:NameBot") or 'دراكون')
local GetJson = '{"BotId": '..Dragon..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevSOFI:get(Dragon.."SOFI:Groups:Links"..v)
Welcomes = DevSOFI:get(Dragon..'SOFI:Groups:Welcomes'..v) or ''
SOFIConstructors = DevSOFI:smembers(Dragon..'SOFI:SOFIConstructor:'..v)
BasicConstructors = DevSOFI:smembers(Dragon..'SOFI:BasicConstructor:'..v)
Constructors = DevSOFI:smembers(Dragon..'SOFI:Constructor:'..v)
Managers = DevSOFI:smembers(Dragon..'SOFI:Managers:'..v)
Admis = DevSOFI:smembers(Dragon..'SOFI:Admins:'..v)
Vips = DevSOFI:smembers(Dragon..'SOFI:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #SOFIConstructors ~= 0 then
GetJson = GetJson..'"SOFIConstructors":['
for k,v in pairs(SOFIConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..Dragon..'.json', "w")
File:write(GetJson)
File:close()
local SOFI = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. SOFI .. '" -F "chat_id='..DraGon..'" -F "document=@'..Dragon..'.json' .. '" -F "caption=⌯︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..Dragon..'.json')
DevSOFI:set(Dragon.."SOFI:AutoFile:Time",os.date("%x"))
end
else 
DevSOFI:set(Dragon.."SOFI:AutoFile:Time",os.date("%x"))
end
end

end
return {
Dragon = AutoFile
}