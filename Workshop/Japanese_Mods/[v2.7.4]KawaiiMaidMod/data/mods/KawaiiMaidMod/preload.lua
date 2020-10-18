-- Kawaii A&M Transport System(AMTS)

-- ■納品アイテムid,ポイント
local pac_list = {
	"diamond", 1000,
	"kawaii_amts_pac_t1_01", 250,
	"kawaii_amts_pac_t1_02", 250,
	"kawaii_amts_pac_t1_03", 250,
	"kawaii_amts_pac_t2_01", 500,
	"kawaii_amts_pac_t2_02", 500,
	"kawaii_amts_pac_t2_03", 500
}
local pac_name = {}
local pac_point = {}
for i=1, #pac_list/2 do
	pac_name[i] = pac_list[(i*2)-1]
	pac_point[i] = pac_list[i*2]
end

-- ■一般アイテムid,cost,rank --ツール類が探索で揃ってるとR5までポイントが余るので上位納品をRankで制限してみる(v2.4.6)
local reward_list = {
	"bottle_plastic_small", 50, 1,
	"bottle_plastic", 100, 1,
	"detergent", 200, 2,
	"jar_glass", 150, 2,
	"kawaii_bottle_2l", 200, 2,
	"kawaii_jerrycan_10l", 300, 2,
	"kawaii_jerrycan_20l", 500, 2,
	"lighter", 100, 2,
	"emer_blanket", 300, 2,
	"picklocks", 750, 2,
	"nail", 500, 3,
	"duct_tape", 1000, 3,
	"small_storage_battery", 500, 3,
	"battery", 500, 3,
	"toolbox", 2000, 3,
	"welder", 3000, 3,
	"soldering_iron", 1500, 3,
	"solder_wire", 750, 3,
	"gunpowder", 500, 4,
	"copper", 500, 4,
	"30gal_drum", 1000, 4,
	"smokebomb", 500, 4,
	"flashbang", 500, 4,
	"EMPbomb", 750, 4,
	"generator_7500w", 2500, 4,
	"battery_ups", 1000, 4,
	"kawaii_portable_kitchen", 2000, 4,
	"e_tool", 1000, 4,
	"medium_storage_battery", 750, 5,
	"atomic_lamp", 2000, 5,
	"1st_aid", 2000, 6,
	"bio_tools", 3000, 6,
	"solar_panel_v2", 1000, 6,
	"large_repairkit", 2500, 6,
	"anesthesia", 1000, 7,
	"bio_power_storage_mkII", 2000, 7,
	"omnicamera", 800, 7,
	"headlight_reinforced", 500, 7,
	"storage_battery", 1000, 8, --R8は2年目秋初め頃。2RP/D DP800(500*2+800=MAX1800P/D) 転送フルチャージ化
	"solar_panel_v3", 2000, 8,
	"bio_probability_travel", 5000, 9, --R9は3年目直前。解放要素が恐らく最も少ない所…しかしここまできたらラストのR10まで行って色々解放されたくなる
	"bio_speed", 5000, 9,
	"plut_cell", 3000, 10
}

-- ■素材系アイテム表示名,id,cost,rank --序盤の余ったポイントの受け皿と思いきや余らす状況で1~4x2程度では…R5あたりからDPとチャージ量と係数分で平時も…と思ったらR5からポイント需要が…
local material_list = {
	"ビニール袋", "bag_plastic", 200, 2,
	"木材", "2x4", 500, 2,
	"プラスチック片", "plastic_chunk", 500, 2,
	"端切れ(革)", "leather", 500, 2, 
	"布", "rag", 500, 2,
	"糸", "thread", 500, 2,
	"鉄屑", "scrap", 500, 2,
	"ケブラー", "kevlar_plate", 1000, 4,
	"ノーメックス", "nomex", 1000, 4
}

-- ■装備系アイテムid,cost,rank --消耗品系の用途が欲しい
local equip_list = {
	"kawaii_arrow_ribbon", 200, 2,
	"kawaii_crowbar_lance", 2500, 3,
	"kawaii_glass_bow", 3000, 3,
	"kawaii_secretpoach", 1500, 4,
	"kawaii_maid_hat_thermal_off", 2000, 5,
	"kawaii_maid_dress_ex", 3500, 5,
	"kawaii_arrow_feather", 750, 5,
	"kawaii_leila", 6000, 6,
	"kawaii_shelia_off", 6000, 6,
	"kawaii_rita_and_rosa", 3500, 6,
	"kawaii_crystal_td", 4000, 7,
	"kawaii_maid_hat_lss", 2500, 7,
	"kawaii_maid_dress_lss", 4500, 7,
	"kawaii_boots_hi", 1500, 7,
	"kawaii_shoes_hi", 1500, 7,
	"kawaii_death_scythe", 8500, 8,
	"kawaii_arrow_little_mary", 2000, 9
}

-- ■液体表示名,内容量(L),id,コスト,ランク
local liquid_list = {
	"水", 2, "water", 250, 3, --R3は10日目。早ければ車両を触り始める頃？
	"綺麗な水", 0.5, "water_clean", 300, 3,
	"ランプオイル", 0.5, "lamp_oil", 500, 3,
	"ガソリン", 0.5, "gasoline", 500, 3,
	"綺麗な水", 2, "water_clean", 500, 4,
	"ランプオイル", 2, "lamp_oil", 1000, 4,
	"ガソリン", 2, "gasoline", 1000, 4,
	"水", 10, "water", 1000, 5, --R5は1年目秋終わり頃。基本的な物が揃う頃？ここからチャージ量とか変わるから1日あたり1.5RPとpacsys大のレシピ本で納品からのポイント倍加
	"ガソリン", 10, "gasoline", 1500, 5,
	"軽油", 10, "diesel", 1500, 5,
	"水", 20, "water", 1500, 7, --R7は2年目夏初め？
	"ガソリン", 20, "gasoline", 2500, 7,
	"軽油", 20, "diesel", 2500, 7
}

local l_name = {}
local l_amount = {}
local l_id = {}
local l_cost = {}
local l_rank = {}
for i=1, #liquid_list/5 do
	l_name[i] = liquid_list[(i*5)-4]
	l_amount[i] = liquid_list[(i*5)-3]
	l_id[i] = liquid_list[(i*5)-2]
	l_cost[i] = liquid_list[(i*5)-1]
	l_rank[i] = liquid_list[i*5]
end

-- ■あちこちで参照しそうなやつ
AMTS_Point = 0
AMTS_MaxPoint = 3
AMTS_RP = 0
AMTS_Rank = 1
AMTS_NextRP = 0
AMTS_JumpList_name = {}
AMTS_JumpCost = 50 --■テレポートコスト
AMTS_reqRP = { 3, 7, 12, 15, 20, 25, 30, 50, 60, 9999 } --■ランク毎の要求RankPoint (※今は1季91日)デフォルトで1季14日、年56日 R1-4[1/D]R5-[1.5/D]R8-[2/D] R3=10 R5=37(27) R7=82(34) R8=112(23) R9=163(26) R10=223(30)
AMTS_DP = { 0, 100, 200, 400, 800, 2000 } --■2ランク毎に増える毎日の自動獲得ポイント
InitFlag_Point = 0

-- ■打つのがめんどくさい
DNr = "kawaii_amts_reciver"
DNt = "kawaii_amts_transmitter"
DNv = "kawaii_amts_point_viewer"

-- ■未解放時のメニュー表記
local equipStr = "<color_dark_gray>[[ロックされています]]:解放Rank2</color>"
local materialStr = "<color_dark_gray>[[ロックされています]]:解放Rank2</color>"
local liquidStr = "<color_dark_gray>[[ロックされています]]:解放Rank3</color>"
local armsStr = "<color_dark_gray>[[ロックされています]]:解放Rank5</color>"


-- ■転送要請(アイテム入手)アイテムの処理
function amts_reciver(item2, active)
	Load_AMTS_Point()
	EditRP(0)

	if AMTS_Rank > 1 then
		equipStr = "装備転送"
		materialStr = "素材転送"
	end
	if AMTS_Rank > 2 then
		liquidStr = "液体転送"
	end
	if AMTS_Rank > 4 then
		armsStr = "AM-ARMSコントロール"
	end
	
	local c = CreateMenu("AMTS-転送(所有ポイント:" .. AMTS_Point .. "/Rank:" .. AMTS_Rank .. "/Next:" .. AMTS_NextRP ..")" , armsStr, "テレポーター起動", "物資転送", materialStr, liquidStr, equipStr, "やめる")
		if c == 0 then --■AM-ARMSコントロール
			if AMTS_Rank < 5 then
				cmsg("light_red", "このコマンドはRank5から利用可能です")
				return
			end
			ARMSMenu("AM-ARMSコントロール(所有ポイント:" .. AMTS_Point .. "/Rank:" .. AMTS_Rank .. "/Next:" .. AMTS_NextRP .. ")")
			
		elseif c == 1 then --■テレポーターの起動
			amts_teleport(item2)
			
		elseif c == 2 then --■物資転送
			p3menu(reward_list,item2)
		
		elseif c == 3 then --■素材転送
			if AMTS_Rank < 2 then
				cmsg("light_red", "このコマンドはRank2から利用可能です")
				return
			end
			p3menu(material_list,item2)
			
		elseif c == 4 then --■液体転送
			if AMTS_Rank < 3 then
				cmsg("light_red", "このコマンドはRank3から利用可能です")
				return
			end
			local no = LiquidMenu("何を転送しますか？(所有ポイント:" .. AMTS_Point .. "/Rank:" .. AMTS_Rank .. "/Next:" .. AMTS_NextRP ..")")
			if no == #l_name then
				cmsg("cyan","キャンセルしました")
				return
			end
			
			no = no + 1
			local bottle = ""
			if l_amount[no] == 0.5 then
				bottle = "bottle_plastic"
			elseif l_amount[no] == 2 then
				bottle = "kawaii_bottle_2l"
			elseif l_amount[no] == 10 then
				bottle = "kawaii_jerrycan_10l"
			elseif l_amount[no] == 20 then
				bottle = "kawaii_jerrycan_20l"
			end

			local liquid = item(l_id[no],1)
			local item = StackLiquid(bottle,l_id[no],l_amount[no]/0.25)
			ReceiveItem(item,l_cost[no],l_rank[no],item2.charges)
			
		elseif c == 5 then --■装備転送
			if AMTS_Rank < 2 then
				cmsg("light_red", "このコマンドはRank2から利用可能です")
				return
			end
			p3menu(equip_list,item2)
			
		elseif c == 6 then

		else
			cmsg("red", "[kawaii error!!]選択肢IDが範囲外です(R1)")
		end
		
end

-- ■debug
function debugAdd(point)
	EditCharges(DNr, 6)
	EditCharges(DNt, 12)
	EditPoint(point)
	msg("DebugAdded!!")
end

-- ■3つの座標を表示する(debug)
function PosMSG(name)
	local p
	p = player:global_omt_location()
	msg2("omt", name, math.ceil(p.x), math.ceil(p.y), math.ceil(p.z))
	p = player:global_sm_location()
	msg2("sm", name, math.ceil(p.x), math.ceil(p.y), math.ceil(p.z))
	p = player:global_square_location()
	msg2("square", name, math.ceil(p.x), math.ceil(p.y), math.ceil(p.z))
end

-- ■3要素配列用転送メニュー(手抜き用)
function p3menu(list,item2)
	local title = "何を転送しますか？(所有ポイント:" .. AMTS_Point .. "/Rank:" .. AMTS_Rank .. "/Next:" .. AMTS_NextRP .. ")"
	local name, rank, cost = RewardListMenu(title,list)
	if name ~= nil then
		ReceiveItem(item(name,1),cost,rank,item2.charges)
	else
		cmsg("cyan", "キャンセルしました。")
	end
end

-- ■テレポーター起動
function amts_teleport(it)
	LoadJumpList(it)
	local menu = game.create_uimenu()
	local choice = -1
	menu.title = "テレポート先を選んで下さい(所有ポイント:" .. AMTS_Point .. "/Rank:" .. AMTS_Rank .. ")"
	local n = AMTS_JumpList_name
	
	for i = 0, 9 do
		local omx = tonumber(it:get_var("teleport_omx" .. i, "0"))
		local omy = tonumber(it:get_var("teleport_omy" .. i, "0"))
		local omz = tonumber(it:get_var("teleport_omz" .. i, "0"))
		local pstr = string.format("<color_dark_gray>(%s,%s,%s)</color>", math.ceil(omx), math.ceil(omy), math.ceil(omz))
		
		if i < AMTS_Rank + 1 then
			menu:addentry("<color_pink>[slot" .. math.ceil(i) .. "]</color>" .. n[i] .. pstr)
		else
			menu:addentry("<color_dark_gray>[slot" .. math.ceil(i) .. "]" .. " --- Locked(" .. "Rank" .. i ..  ") ---</color>")
		end
	end
	
	menu:addentry("やめる")
	menu:query(true)
	local no = math.ceil(menu.selected)
	
	if no > #AMTS_JumpList_name then
		cmsg("cyan", "テレポートをキャンセルしました。")
		return
	end
	
	if no > AMTS_Rank then
		cmsg("light_red", "現在のRankでは使用できないスロットです。")
		return
	end
  
	local no2
	if no == 0 then
		no2 = CreateMenu("所有ポイント:" .. AMTS_Point .. "/" .. "[スロット" .. no .. "]" .. AMTS_JumpList_name[no], "<color_light_green>["..AMTS_JumpCost.."Point]</color>テレポート", "やめる")
		if no2 == 0 then
			kawaii_teleport(it,no)
			return
		else
			cmsg("cyan", "テレポートをキャンセルしました。")
			return
		end
	end
	
	no2 = CreateMenu("[slot" .. no .. "]" .. AMTS_JumpList_name[no], "<color_light_green>["..AMTS_JumpCost.."Point]</color>テレポート", "現在位置を登録", "登録名の編集", "やめる")
	if no2 == 0 then --■テレポート
		local no3 = CreateMenu("現在の座標を一時的に登録しますか？", "登録してテレポート", "登録せずにテレポート", "キャンセル")
		
		if no3 == 0 then --■一時登録あり
			if it:get_var("teleport_name" .. no, "null") == "null" then
				cmsg("light_red", "座標が記録されていません。")
				return
			end
			
			local om = player:global_omt_location()
			local gpos = player:global_square_location()
			cmsg("cyan", "[Slot0]一時登録座標 にテレポート前の座標を登録しました。")
			kawaii_teleport(it,no)
			kawaii_teleport_save(it, 0, "一時登録座標", om, gpos)
			
		elseif no3 == 1 then --■一時登録なし
			kawaii_teleport(it,no)
			
		else --■キャンセル
			cmsg("cyan", "テレポートをキャンセルしました。")
			return
		end

	elseif no2 == 1 then --■登録
		local regname = game.string_input_popup("",30,"登録名を入力してください\n(未入力でキャンセル)")
		if regname == "" then
			cmsg("cyan", "テレポートリストの登録をキャンセルしました")
			return
		end
		
		kawaii_teleport_save(it,no,regname)
		msg("[Slot%s]%s に現在位置を登録しました。", no, regname)
		
	elseif no2 == 2 then --■編集
		if it:get_var("teleport_name" .. no, "null") == "null" then
			cmsg("light_red", "未登録スロットの名前は変更できません。")
			return
		end
		
		local regname = game.string_input_popup("",30,"新しい名前を入力してください\n(未入力でキャンセル)")
		if regname == "" then
			cmsg("cyan", "テレポートリストの登録名編集をキャンセルしました。")
			return
		end
		
		it:set_var("teleport_name" .. no, regname)
		cmsg("cyan", "[Slot%s]の登録名を[%s]に変更しました。", no, regname)
		
	else --■キャンセル
		return
	end

	function tmptp(it2,no2)

	end
end

-- ■テレポート先名前リストのロード
function LoadJumpList(it)
	local name
	for i = 0, 9 do
		name = it:get_var("teleport_name" .. i, "未登録")
		if i == 0 then
			AMTS_JumpList_name[i] = "一時登録座標"
		else
			AMTS_JumpList_name[i] = name
		end
	end
end

-- ■納品(ポイント入手)アイテムの処理
function amts_transmitter(item2, active)
	Load_AMTS_Point()
	EditRP(0)
	local c = CreateMenu("AMTS-納品(所有ポイント:" .. AMTS_Point .. "/Rank:" .. AMTS_Rank .. "/Next:" .. AMTS_NextRP ..")" , "納品する","納品アイテムリスト", "AMTSパッケージングシステムをもらう", "やめる")
	if c == 0 then
		local no = ItemListMenu("何を納品しますか？")
		if no == "noitem" then
			return
		end
		if no == nil or no == "cancel" then
			cmsg("cyan", "納品をキャンセルしました。")
			return
		end
		
		SendItem(GetInvItem(pac_name[no]),pac_point[no],item2.charges)
	elseif c == 1 then
		cmsg("cyan", "納品リストを確認します。")
		viewNouhin()
	elseif c == 2 then
		if item2.charges == 0 then
			cmsg("light_red", "チャージ量が不足しています")
			return
		end
		
		player:i_add(item("kawaii_amts_pacsys",1))
		cmsg("cyan", "AMTSパッケージングシステムをもらいました")
		EditCharges(DNt, -1)
	elseif c == 3 then
	
	else
		cmsg("red", "[kawaii error!!]選択肢IDが範囲外です(T1)")
	end
end

-- ■AMTSインストールキット(外箱のメモを読む)
function amts_kit(item, active)
	game.popup(gText("boxmemo"))
	cmsg("light_green", "おしゃれな箱を開けました")
	player:i_add(item("kawaii_amts_box2",1))
	player:i_add(item("kawaii_amts_manual",1))
	player:i_rem(item)
end

-- ■AMTSインストールキット(施術)
function amts_kit2(item, active)
	cmsg("light_green", "AMTSデバイスを埋め込みました。")
	player:set_value("Kawaii_AMTS_Active", "true")
	player:i_add(item("kawaii_amts_reciver", 1))
	player:i_add(item("kawaii_amts_transmitter", 1))
	player:i_add(item("kawaii_amts_point_viewer", 1))
	EditRP(0)
	EditPoint(0)
	player:i_rem(item)
end

-- ■AMTSマニュアルアイテムの処理
function amts_manual(item, active)
	game.popup(gText("manual_1"))
	game.popup(gText("manual_2"))
	game.popup(gText("manual_3"))
end

-- ■アイテム受取
function ReceiveItem(item,cost,rank,charges)
	if charges == 0 then
		cmsg("light_red", "チャージ量が不足しています")
		return
	elseif rank > AMTS_Rank then
		cmsg("light_red", "ランクが不足しています")
		return
	elseif cost > AMTS_Point then
		cmsg("light_red", "ポイントが不足しています")
		return
	end
	
	if item:ammo_type():str() == "battery" and item:typeId() ~= "kawaii_UPS" then
		local citem = item("battery",1)
		citem.charges = item:ammo_capacity()
		item:fill_with(citem)
	end
	
	if item:typeId() == "battery" then
		local citem = item("battery",1)
		citem.charges = AMTS_Rank * 100
		item = citem
	end
	
	if item:typeId() == "lighter" then
		item.charges = 100
	end
	
	local dname = item:display_name()
	local flag = 0
	local n = material_list
	local items = {}
	for i,v in pairs(n) do
		if item:typeId() == v then
			for i=1, AMTS_Rank*2 do
				player:i_add(item)
			end
			dname = item:display_name() .. " x" .. AMTS_Rank*2 .. "(Rank)"
			flag = 1
		end
	end

	if flag == 0 then
		player:i_add(item)
	end
	EditPoint(-(cost))
	EditCharges(DNr,-1)
	msg("<color_pink>[-" .. cost .. "Point]</color>" .. dname .. " を転送しました。(所有ポイント:" .. AMTS_Point .. ")")
end

-- ■アイテム納品
function SendItem(item,point,charges)
	if charges == 0 then
		cmsg("light_red", "チャージ量が不足しています")
		return
	end
	EditPoint(point)
	EditCharges(DNt, -1)
	player:i_rem(item)
	msg("<color_pink>[+" .. point .. "Point]</color>" .. item:display_name() .. " を納品しました。(所有ポイント:" .. AMTS_Point .. ")")
	EditRP(1)
end

-- ■ランクポイントの増減と関連処理(初期化ロードは0で)
function EditRP(point)
	AMTS_RP = tonumber(player:get_value("Kawaii_AMTS_RP"))
	
	if AMTS_RP == nil then
		AMTS_RP = 0
	end
	
	if AMTS_Rank == 10 then
		ATMS_Rank = 10
		AMTS_NextRP = 9999
		return
	end
	
	AMTS_RP = AMTS_RP + point
	
	local oldRank = AMTS_Rank
	local rp2 = AMTS_RP
	local i = 1
	local d = AMTS_reqRP[1]
	while AMTS_Rank < 10 and rp2 > 0 do
		if rp2 > AMTS_reqRP[i] - 1 then
			rp2 = rp2 - AMTS_reqRP[i]
		else
			break
		end
		i = i + 1
	end
	
	AMTS_Rank = i
	AMTS_NextRP = AMTS_reqRP[i] - rp2
	
	if point > 0 and AMTS_Rank > oldRank then
		cmsg("light_green", "AMTSランクが上がりました!!(Rank" .. i .. ")")
		local apt = "自動獲得ポイント" .. AMTS_DP[math.ceil(i/2)] .. "->" .. AMTS_DP[math.ceil(i/2)+1]
		local bonus = "転送アイテム追加 "
		
		if i == 2 then
			bonus = bonus .. apt
			GiveItem("canteen")
			GiveItem("kawaii_raincoat")
		elseif i == 3 then
			bonus = bonus
			GiveItem("kawaii_crowbar_lance")
		elseif i == 4 then
			bonus = bonus .. apt
			GiveItem("kawaii_book_pacsys") --上位納品アイテムを解放するレシピブック
		elseif i == 5 then
			bonus = bonus
			local ammo = item("kawaii_308AM",1)
			ammo.charges = 20
			local mag = item("kawaii_eve_mag",1)
			mag:put_in(ammo)
			local item = item("kawaii_amts_eve",1)
			item:put_in(mag)
			player:i_add(item)
			msg("<color_light_green>ランクアップボーナス:</color>" .. item:display_name())
			GiveItem("kawaii_scarf")
		elseif i == 6 then
			bonus = bonus .. apt
			GiveItem("kawaii_proto_bottle")
		elseif i == 7 then
			bonus = bonus
			GiveItem("kawaii_hitec_megane")
		elseif i == 8 then
			bonus = bonus .. apt
		elseif i == 9 then
			bonus = bonus
		elseif i == 10 then
			bonus = bonus .. apt
		end
		
		msg(bonus)
	end

	function GiveItem(itemstr)
		local item = item(itemstr,1)
		player:i_add(item)
		msg("<color_light_green>ランクアップボーナス:</color>" .. item:display_name())
	end

	player:set_value("Kawaii_AMTS_RP", tostring(AMTS_RP))
end

-- ■メニューテキスト用のランクとポイントを確認・表示・色分けして1行分返す
function MergeMenuText(name,rank,point,grayoutmode)
	local rankstr, coststr, name2
	local c = true

	if rank > AMTS_Rank then
		rankstr = "<color_dark_gray>[Rank" .. rank .. "]</color>" 
		c = false
	else
		rankstr = "<color_pink>[Rank" .. rank .. "]</color>" 
	end

	if point > AMTS_Point then
		coststr = "<color_dark_gray>[" .. point .. "Point]</color>"
		c = false
	else
		coststr = "<color_light_green>[" .. point .. "Point]</color>"
	end

	if grayoutmode == "false" then
		c = true --■一部の装備が強制的にgrayになるのではずしたい時がある
	end
	
	if c then
		name2 = rankstr .. coststr .. name
	else
		name2 = rankstr .. coststr .. "<color_dark_gray>" .. name .. "</color>"
	end
	
	return name2
end

-- ■ARMSメニュー
function ARMSMenu(title)
	local menu = game.create_uimenu()
	local choice = -1
	menu.title = title
	local n = {
	"EVEマガジン装填(20)", 500, 5
	}

	local name = {}
	local cost = {}
	local rank = {}
	for i=1, #n/3 do
		name[i] = n[(i*3)-2]
		cost[i] = n[(i*3)-1]
		rank[i] = n[i*3]
	end

	for i in pairs(name) do
		local name2 = MergeMenuText(name[i], rank[i], cost[i], "false")
		menu:addentry(name2)
	end

	menu:addentry("やめる")
	menu:query(true)
	local no = menu.selected
	
		if rank[no+1] > AMTS_Rank then
			cmsg("light_red", "ランクが不足しています。")
			return
		end
		if cost[no+1] > AMTS_Point then
			cmsg("light_red", "ポイントが不足しています。")
			return
		end
		
	if no < #name then
		if no == 0 then
			local eve = GetInvItem("kawaii_amts_eve")
			if eve:typeId() == "null" then
				cmsg("red", "EVE-Scoutが見つかりませんでした。")
				return
			end

			local cmag = eve:magazine_current()
			if not cmag then
				cmsg("red", "EVE-Scoutにマガジンが装填されていません。")
				return
			end

			if EditCharges(DNr,-1) == 0 then
				return
			end

			player:i_rem(cmag)
			local mag = item(eve:magazine_default(),1)
			local ammo = item("kawaii_308AM",1)
			ammo.charges = 20
			mag:put_in(ammo)
			player:i_add(mag)
			
			EditPoint(-(cost[no+1]))
			cmsg("cyan", "AMDS内のEVEマガジンが装填されました。")
		end
		return
	else
		return
	end
end

-- ■液体がスタックできないのでforで回してitemで返す。液体が入ってる分他より気をつけて扱おう(うまい)
function StackLiquid(bottle,liquid,count)
	local item2 = item(bottle,1)
	for i=1,count do
		item2:fill_with(item(liquid,1))
	end
	return item2
end

-- ■液体メニューリスト
function LiquidMenu(title)
	local menu = game.create_uimenu()
	local choice = -1
	menu.title = title
	local n = l_name

	for i in pairs(n) do
		local rankstr,coststr,name
		local c = true
		if l_rank[i] > AMTS_Rank then
			rankstr = "<color_dark_gray>[Rank" .. l_rank[i] .. "]</color>" 
			c = false
		else
			rankstr = "<color_pink>[Rank" .. l_rank[i] .. "]</color>" 
		end
		if l_cost[i] > AMTS_Point then
			coststr = "<color_dark_gray>[" .. l_cost[i] .. "Point]</color>"
			c = false
		else
			coststr = "<color_light_green>[" .. l_cost[i] .. "Point]</color>"
		end

		if c then
			name = rankstr .. coststr .. l_name[i] .. "(" .. l_amount[i] .. "L)"
		else
			name = rankstr .. coststr .. "<color_dark_gray>" .. l_name[i] .. "(" .. l_amount[i] .. "L)" .. "</color>"
		end
		
		menu:addentry(name)
	end
	
	menu:addentry("やめる")
	menu:query(true)
	choice = menu.selected
	return choice
end

-- ■リワードリストを作る
function RewardListMenu(title,itemlist)
	local menu = game.create_uimenu()
	local choice = -1
	menu.title = title
	
	local dname = {}
	local name = {}
	local cost = {}
	local rank = {}
	if itemlist == material_list then
		local x = 4
		for i=1, #itemlist/x do
			dname[i] = itemlist[(i*x)-3]
			name[i] = itemlist[(i*x)-2]
			cost[i] = itemlist[(i*x)-1]
			rank[i] = itemlist[i*x]
		end
	else
		local x = 3
		for i=1, #itemlist/x do
			name[i] = itemlist[(i*x)-2]
			cost[i] = itemlist[(i*x)-1]
			rank[i] = itemlist[i*x]
		end
	end
	
	local n = name
	for i in pairs(n) do
		local item = item(name[i],1)
		
		if item:typeId() == "battery" then
			local citem = item("battery",1)
			citem.charges = AMTS_Rank * 100
			item = citem
		end
		
		if item:typeId() == "lighter" then
			item.charges = 100
		end
		
		local name2
		if itemlist == material_list then
			name2 = MergeMenuText(item:display_name() .. " x" .. AMTS_Rank*2 , rank[i], cost[i], "false")
		else
			name2 = MergeMenuText(item:display_name(), rank[i], cost[i], "false")
		end

		menu:addentry(name2)
	end
	
	menu:addentry("やめる")
	menu:query(true)
	local no = menu.selected
	
	if no < #name then
		no = no+1
		return name[no], rank[no], cost[no]
	else
		return nil, nil, nil
	end
end

-- ■所持アイテムからリストを検索して納品リストを作る(持ってるものだけ表示)
function ItemListMenu(title)
	local menu = game.create_uimenu()
	local choice = -1
	menu.title = title
	local n = pac_name
	local has_list = {}
	local no = 0
	local count = 0
	
	for i in pairs(n) do
		if not GetInvItem(n[i]):is_null() then
			has_list[no] =  GetInvItem(n[i])
			menu:addentry("<color_light_green>[" .. pac_point[i] .. "Point]</color>" .. has_list[no]:display_name())
			has_list[no] = i
			no = no + 1
			count = count + 1
		end
	end
	if count == 0 then
		cmsg("light_red", "納品アイテムがありません。")
		return "noitem"
	end
	
	menu:addentry("やめる")
	menu:query(true)
	choice = menu.selected
	if #has_list < choice then
		return "cancel"
	end
	return has_list[choice]
end

-- ■ポイントの増減
function EditPoint(point)
	if InitFlag_Point == 0 then
		local ampv = item("kawaii_amts_point_viewer",1)
		AMTS_MaxPoint = ampv:ammo_capacity()
		InitFlag_Point = 1
	end
	local item = GetInvItem("kawaii_amts_point_viewer")
	Load_AMTS_Point()
	AMTS_Point = AMTS_Point + point
	
	if AMTS_Point == AMTS_MaxPoint or AMTS_Point > AMTS_MaxPoint then
		AMTS_Point = AMTS_MaxPoint
		cmsg("light_red", "AMTSポイントの上限に達しました。")
	end
	
	AMTS_Point = math.ceil(AMTS_Point)
	item.charges = AMTS_Point
	player:set_value("Kawaii_AMTS_Point", tostring(AMTS_Point))
end

-- ■ポイントをキャラデータからロード
function Load_AMTS_Point()
	AMTS_Point = tonumber(player:get_value("Kawaii_AMTS_Point"))
	if AMTS_Point == nil then
		AMTS_Point = 0
	end
end

-- ■デバイスのチャージを増減する
function EditCharges(name, point)
	local item = GetInvItem(name)
	if point > 0 then
		if math.floor(item.charges) < item:ammo_capacity() then
			msg(item:display_name() .. " のチャージ量+" .. point .. " =")
			item.charges = item.charges + point
			if item.charges > item:ammo_capacity() then
				item.charges = item:ammo_capacity()
				cmsg("light_red", item:display_name() .. "のチャージ量が上限に達しました。")
			end
			msg(item:display_name())
		else
			cmsg("light_red", item:display_name() .. " はこれ以上チャージできません。")
		end
	end
	if point < 0 then
		if math.floor(item.charges)  > 0 then
			item.charges = item.charges + point
		else
			cmsg("light_red", item:display_name() .. " のチャージ量が不足しています。")
			return 0
		end
	end
	
	return 1
end

-- ■足下のアイテムを検索する
function getItemFloor(itemid)
	local stack = map:i_at(player:pos())
	local iter = stack:cppbegin()
	while iter ~= stack:cppend() do
		local tmp = iter:elem()
			if tmp:typeId() == itemid then
				return tmp
			end
		iter:inc()
	end
	return nil
end

-- ■インベントリ内のアイテムをid検索してitem型で返す
function GetInvItem(itemid)
	local i = -1
	local item = player:i_at(i)
	while i == -1 or item:typeId() ~= "null" do
		if tostring(item:typeId()) == itemid then
			item = player:i_at(i)
			break
		end
		i = i + 1
		item = player:i_at(i)
	end
	return item
end

-- ■納品アイテム確認用リストを表示
function viewNouhin()
	local text = "         <<  納品アイテムリスト  >>     \n"
	for i in pairs(pac_name) do
		text = text .. "<color_pink>[" .. pac_point[i] .. "Point]</color> " .. item(pac_name[i],1):display_name() .. "\n"
	end
	game.popup(text)
end

-- ■自動獲得ポイントを返す
function getDP()
	return AMTS_DP[math.floor(AMTS_Rank/2)+1]
end

-- ■地形idを返す
function getFloorID(point)
	local terrain_int_id = map:ter(point):to_i()
	local terrain = game.get_terrain_type(terrain_int_id)
	local terrain_str_id = terrain.id:str()
	return terrain_str_id
end

-- ■メニューつくる
function CreateMenu(title,...)
	local n = {...}
	local menu = game.create_uimenu()
	local choice = -1
	menu.title = title
	
	for i in pairs(n) do
		menu:addentry(n[i])
	end
	
	menu:query(true)
	choice = menu.selected
	return choice
end

-- ■テキストを書きやすく
function _(text)
    return tostring(text):gsub("^\t+", ""):gsub("\n\t+$", ""):gsub("(\n)\t+", "%1")
end

-- ■カラーメッセージ
function cmsg(color, ...)
	local str = "<color_" .. color .. ">" .. string.format(...) .. "</color>" .. " "
	game.add_msg(tostring(str))
end

-- ■変数カケール
function msg(...)
	local s = string.format(...)
	game.add_msg(s)
end

-- ■可変引数メッセージ(さくさくdebug用)
function msg2(msg,...)
	local n = {...}
	local str = msg
	for i in pairs(n) do
		str = str .. " : " .. n[i]
	end
	game.add_msg(tostring(str))
end

-- ■配列がsetできないのでforでぐるぐる
function ArraySave(list,name)
	for i = 1, #list do
		player:set_value(name .. i, list[i])
	end
end

-- ■配列がgetできないので
function ArrayLoad(list,name)
	for i = 1, #list do
		list[i-1] = player:get_value(name .. i)
	end
end

-- ■テキスト置き場
function gText(name)
	local text = "missing strings"
	--本文22行が限界っぽい
	if name == "boxmemo" then
		text = _[[
		                   <color_cyan>(箱に貼り付けられた紙)</color>
		  この度は、A&M Transport System βテスターにご応募いただき
		  ありがとうございました。
		  
		  厳正な抽選の結果、ご当選されましたので
		  サービスをご利用頂く上で必要な製品一式をお届けさせて頂きました。
		  
		  サービスのご利用を開始して頂くには
		  同梱のインプラント施術キットを
		  取扱説明書をよくお読み頂いた上でご使用ください。
		  
		  また、事前にご説明させて頂いた通り
		  インプラント施術をした段階で利用規約に同意して頂いた物と
		  させて頂きますので、ご了承ください。
		  
		  A&M Transport System が、お客様にとって
		  良いサービス体験になりますようお祈り致します。
		  
		  <color_light_blue>A&M Transport System</color>
		  <color_light_blue>βテスターサポートデスク:</color>support@AM@AMTS
		]]
	end
	if name == "manual_1" then
		text = _[[
			 ---+---+---+---+   A&M Transport System<color_cyan>(AMTS)</color>   +---+---+---+--- 
			                         <color_cyan>(取扱説明書)</color> 1/3
			 
			<color_pink>【概要】</color>
			    体内に極小の制御デバイスを埋め込む事で
			    A&M拠点と双方向の次元転送が可能になるシステム一式、及び
			    インプラント施術キットです。
			<color_pink>【施術方法】</color>
			    1,同梱のシリンダーの2カ所の電源ボタン(図1)を同時に5秒以上押し
			       電源を入れる
			 
			    2,シリンダーの表示部が[準備完了]になるまで待つ
			       (30秒程度)
			 
			    3,シリンダーの▼マーク側を二の腕(図2)にあてる
			       ※その他の場所でも問題ありませんが
			         当社検証により二の腕が最も不快感が少ない結果となり
			         ましたので、二の腕への施術をお勧めします
			 
			    4,そのままの状態でシリンダー上部のボタン(図3)を押すと
			       ナノマシンが体内に入り、システムを構築・初期化します
			 ---+---+---+---+---+---+---+--------+---+---+---+---+---+---+--- 
		]]
	end
	if name == "manual_2" then
		text = _[[
			 ---+---+---+---+   A&M Transport System<color_cyan>(AMTS)</color>   +---+---+---+--- 
			                         <color_cyan>(取扱説明書)</color> 2/3
			 
			<color_pink>【使用方法】</color>
			    各操作は脳波コントロールにより行います
			     ※本書ではVoiceImageControl(VIC)と記述します
			    頭の中で発音する様にイメージする事でコマンドを指示して下さい
			    デフォルト状態では各コマンドに対して頭の中で
			    音声案内が再生されますので、それに従って習得して頂くことを
			    お勧め致します。
			<color_pink>【基本操作】</color>(VoiceImageControlコマンド/ステート)
			    <color_light_blue>[チュートリアル]/[ON,OFF]</color> : チュートリアル案内の切り替え
			    <color_light_blue>[ヘルプ]/[検索単語]</color> : 使用方法を音声案内で確認する
			    <color_light_blue>[転送]/[各転送物の視覚イメージかID]</color> : 各物資の双方向転送
			     ※受信時は手のひらの上に存在するイメージをして下さい
			     ※大きな物の送信時は専用パッケージをご利用ください(P51)
			     ※詳細な使い方やコツなどはP42(転送)をお読み下さい
			    <color_light_blue>[時刻]/[ON/OFF]</color> : 時刻を視界に表示(P5)
			    <color_light_blue>[温度]/[ON/OFF]</color> : 温度を視界に表示(P5)
			    <color_light_blue>[タイマー]/[時間]</color> : タイマーを視界に表示(P5)
				 
			 ---+---+---+---+---+---+---+--------+---+---+---+---+---+---+--- 
		]]
	end
	if name == "manual_3" then
		text = _[[
			 ---+---+---+---+   A&M Transport System<color_cyan>(AMTS)</color>   +---+---+---+--- 
			                         <color_cyan>(取扱説明書)</color> 3/3
			     
			     <color_light_blue>[距離]/[対象物をポインティングする]</color> : 距離を測る(P4)(P7)
			     <color_light_blue>[ガジェット]/[ファイル]</color> : ガジェットを視界に表示(P4)(P8)
			     <color_light_blue>[メモ]/[テキスト]</color> : テキストを保存(P4)(P9)
			     <color_light_blue>[カメラ]/[範囲指示]</color> : 視界イメージを保存(P11)
			     <color_light_blue>[録音]/[開始/停止]</color> : 音声を保存(P16)
			     <color_light_blue>[計算]/[計算式]</color> : 計算をする(P18)
			     <color_light_blue>[ファイルを開く]/[ファイル]</color> : 画像や音声などを表示(P4)(P19)
			 
				 
			 ---+---+---+---+---+---+---+--------+---+---+---+---+---+---+--- 
		]]
	end
	return text
end

-- ■神により記述されたテレポート関数群を弄ったもの
function tri_delta(a, b)
  return tripoint(a.x - b.x, a.y - b.y, a.z - b.z)
end

function kawaii_teleport(it,slot)
  local name = it:get_var("teleport_name" .. slot, "未登録")
  if slot == 0 then
  	name = it:get_var("teleport_name" .. slot, "一時登録座標(未登録)")
  end
  if name == "未登録" or name == "一時登録座標(未登録)" then
    cmsg("light_red", "座標が記録されていません。")
    return 0
  end
  
  if AMTS_Point < AMTS_JumpCost then
  	cmsg("light_red", "ポイントが不足しています。")
  	return
  end
  EditPoint(-AMTS_JumpCost)

  local omx = tonumber(it:get_var("teleport_omx" .. slot, "0"))
  local omy = tonumber(it:get_var("teleport_omy" .. slot, "0"))
  local omz = tonumber(it:get_var("teleport_omz" .. slot, "0"))
  local gx = tonumber(it:get_var("teleport_gx" .. slot, "0"))
  local gy = tonumber(it:get_var("teleport_gy" .. slot, "0"))
  local gz = tonumber(it:get_var("teleport_gz" .. slot, "0"))
  local om = tripoint(omx, omy, omz)
  local gpos = tripoint(gx, gy, gz)

  -- 近くにいるNPCを一緒に連れていく
  local npcs = {}
  local tmp_pos = player:pos()
  for dx = -10, 10 do
      for dy = -10, 10 do
          local npc_loc = tripoint(tmp_pos.x + dx, tmp_pos.y + dy, tmp_pos.z)
          local tmp_npc = game.get_npc_at(npc_loc)
          if tmp_npc then
              if tmp_npc:is_npc() then
                  table.insert(npcs, tmp_npc)
              end
          end
      end
  end
  
  g:place_player_overmap(om)
  local cur_gpos = player:global_square_location()
  local cur_pos = player:pos()

  -- player:pos()で取得できる座標はバッファ上の一時的な座標なので、
  -- global_square_locationで絶対座標を取得して補正する
  local delta = tri_delta(cur_gpos, gpos)
  player:setx(cur_pos.x - delta.x)
  player:sety(cur_pos.y - delta.y)
  player:setz(cur_pos.z - delta.z)

  -- NPCを再配置する
  tmp_pos = player:pos()
  for _,tmp_npc in ipairs(npcs) do
    for dx = -10, 10 do
        for dy = -10, 10 do
            local npc_loc = tripoint(tmp_pos.x + dx, tmp_pos.y + dy, tmp_pos.z)
            if not game.get_critter_at(npc_loc) then
                -- setposで座標を更新するとNPCが現在のovermapに現れる
                tmp_npc:setpos(npc_loc)
            end
        end
    end
  end
  g:reload_npcs()

  cmsg("cyan", "[Slot%s]%s にテレポートしました。(所有ポイント:%s)", slot, name, AMTS_Point)
  return 0
end

function kawaii_teleport_save(it,slot,name,om2,gpos2)
  local om,gpos
  if om2 == null then
    om = player:global_omt_location()
    gpos = player:global_square_location()
  else
    om = om2
    gpos = gpos2
  end
  
  it:set_var("teleport_name" .. slot, name)
  -- intで記憶するとなぜか読み出しが上手くいかないのでstringで記憶しておく
  it:set_var("teleport_omx" .. slot, tostring(om.x))
  it:set_var("teleport_omy" .. slot, tostring(om.y))
  it:set_var("teleport_omz" .. slot, tostring(om.z))
  it:set_var("teleport_gx" .. slot, tostring(gpos.x))
  it:set_var("teleport_gy" .. slot, tostring(gpos.y))
  it:set_var("teleport_gz" .. slot, tostring(gpos.z))

  -- msg("位置を記憶しました。")
  -- msg("Overmap (%d, %d, %d)", om.x, om.y, om.z)
  -- msg("Global square (%d, %d, %d)", gpos.x, gpos.y, gpos.z)
end


game.register_iuse("IUSE_KAWAII_AMTS_KIT", amts_kit)
game.register_iuse("IUSE_KAWAII_AMTS_KIT2", amts_kit2)
game.register_iuse("IUSE_KAWAII_AMTS_MANUAL", amts_manual)
game.register_iuse("IUSE_KAWAII_AMTR", amts_reciver)
game.register_iuse("IUSE_KAWAII_AMTT", amts_transmitter)
