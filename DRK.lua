include('organizer-lib')
include('Binds')
include('how_about_no.lua')

-- **Ganno's DRK lua** --
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid/Stun. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {"Caladbolg","Ragnarok","Anguta","Apocalypse","Liberator","Redemption","Dacnomania"}
	IdleIndex = 1
	IdleArray = {"Regain","Refresh","MaxHP","PDT"}		-- Default Idle Set Is Movement
	DSIndex = 0 --Index for Dark Seal headpiece Potency(0) vs Duration(1)
	add_to_chat(158,'DarkSeal Potency: [On]')
	Armor = 'None'
	Twilight = 'None'
	Attack = 'OFF'	-- Set Default WS Attack Set ON or OFF Her
	Rancor = 'OFF' -- Set Default Rancor ON or OFF Here
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here
	target_distance = 5 -- Set Default Distance Here
	select_default_macro_book() -- Change Default Macro Book At The End
	send_command('wait 2;input /lockstyleset 5')
	
	-- Gavialis Helm --
	elements = {}
	-- elements.equip = {head="Gavialis Helm"}
	elements.Resolution = S{"Lightning","Wind","Earth"}
	elements.Entropy = S{"Dark","Water","Earth"}
	elements.Catastrophe = S{"Dark","Earth"}
	elements.Insurgency = S{"Light","Dark","Fire"}
	
	sc_map = {SC1="Torcleaver", SC2="Entropy", SC3="CrossReaper", SC4="LastResort"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
	
	send_command('bind f1 gs c Weapon') -- Toggle WeaponArray Weapon
	send_command('bind ^` gs c Update')  -- Update Gear Update
	send_command('bind f9 gs c C1')  -- Toogle AccArray C1
	send_command('bind f10 gs c Hybrid') -- Toggle Hybrid TP Hybrid
	
	send_command('bind ^f11 gs c C7') -- Toggle PDT C7
	send_command('bind !f11 gs c C15') -- Toggle MDT C15
	
	send_command('bind f12 gs c C3') -- Toggle Twilight Gear C3
	send_command('bind ^f12 gs c C6') -- Toggle Idle Sets
	
	send_command('bind ^f4 gs c C10') -- Toggle for Dark Seal

	send_command('bind ^f5 input /jobability "Last Resort" <me>; wait 1; input /jobability Hasso <me>; wait 1; input /jobability "Scarlet Delirium" <me>')	-- G1
	send_command('bind !f5 input /jobability "Nether Void" <me>; wait 1; input /jobability "Dark Seal" <me>') 	-- G2
	
	-- Shurikenger Macros
	-- send_command('bind ^!f5 send Shurikenger input /attack <bt>')	-- G5
	-- send_command('bind ^!~f5 send Shurikenger weaponskill "Chant du Cygne" <t>')	-- G6
	
	send_command('bind ^!~f5 send Cyre magic "Cure IV" Odude')	-- G6
	
	-- Voidwatch
	send_command('bind ^!f5 /item "Stalwart\'s Tonic" <me> ; wait 3 ;input /item "Champion\'s Tonic" <me>; wait 3 ;input /item "Ascetic\'s tonic" <me>')
	send_command('bind ^!~f5 input /item "Dusty wing" <me>; wait 3 ;input /item "Monarch\'s Drink" <me>; wait 3 ;input /item "Braver\'s Drink" <me>')
	send_command('bind end input /jobability "Weapon Bash" <t>')
	
	function file_unload ()
		send_command('unbind ^f4')
		send_command('unbind f1')
		send_command('unbind ^`')
		send_command('unbind f9')
		send_command('unbind f10')
		send_command('unbind ^f11')
		send_command('unbind !f11')
		send_command('unbind f12')
		send_command('unbind ^f12')
		send_command('unbind f5')
		send_command('unbind ^f5')
		send_command('unbind !f5')

		-- Unbind from Binds.lua
		send_command('unbind !`')
		send_command('unbind f6')
		send_command('unbind ^f6')
		send_command('unbind !f6')
		send_command('unbind f2')
		send_command('unbind ^f2')
		send_command('unbind !f2')
		send_command('unbind f3')
		send_command('unbind ^f3')
		send_command('unbind ^end')
		send_command('unbind ^delete')
		send_command('unbind pagedown')
		send_command('unbind pageup')
		send_command('unbind ^pageup')
		send_command('unbind ^~f5')
		send_command('unbind ^h')
		send_command('unbind ^m')
		
		send_command('unbind ^!f5')
		send_command('unbind ^!~f5')
		send_command('unbind end')
	end
	
	sets.Idle = {}
	
-- PDT Sets --
	sets.Idle.PDT = {
		ammo="Staunch tathlum +1",
		head="Nyame helm",
		body="Nyame mail",
		hands="Sakpata's gauntlets",
		legs="Nyame flanchard",
		feet="Nyame Sollerets",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Karieyh Ring",
		right_ring="Defending Ring",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		back="Moonlight Cape",		
	}
	sets.Idle.PDT.Liberator = set_combine(sets.Idle.PDT,{main="Liberator",sub="Utu grip"})
	sets.Idle.PDT.Liberator.SAM = set_combine(sets.Idle.PDT,{main="Liberator",sub="Utu grip"})
	sets.Idle.PDT.Ragnarok = set_combine(sets.Idle.PDT,{main="Ragnarok",sub="Utu grip"})
	sets.Idle.PDT.Ragnarok.SAM = set_combine(sets.Idle.PDT,{main="Ragnarok",sub="Utu grip"})
	sets.Idle.PDT.Caladbolg = set_combine(sets.Idle.PDT,{main="Caladbolg",sub="Utu grip"})
	sets.Idle.PDT.Caladbolg.SAM = set_combine(sets.Idle.PDT,{main="Caladbolg",sub="Utu grip"})
	sets.Idle.PDT.Apocalypse = set_combine(sets.Idle.PDT,{main="Apocalypse",sub="Utu grip"})
	sets.Idle.PDT.Apocalypse.SAM = set_combine(sets.Idle.PDT,{main="Apocalypse",sub="Utu grip"})
	sets.Idle.PDT.Anguta = set_combine(sets.Idle.PDT,{main="Anguta",sub="Utu grip"})
	sets.Idle.PDT.Anguta.SAM = set_combine(sets.Idle.PDT,{main="Anguta",sub="Utu grip"})
	sets.Idle.PDT.Dacnomania = set_combine(sets.Idle.PDT,{main="Dacnomania",sub="Utu grip"})
	sets.Idle.PDT.Redemption = set_combine(sets.Idle.PDT,{main="Redemption",sub="Utu grip"})
	
	-- Refresh Sets --
	sets.Idle.Refresh = set_combine(sets.Idle.PDT,{
		head=empty,
		body="Lugra Cloak +1",
		hands={name="Odyssean Gauntlets",augments={'Pet: Mag. Acc.+30','Pet: Mag. Acc.+21 Pet: "Mag.Atk.Bns."+21','"Refresh"+2','Accuracy+6 Attack+6','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
		legs={name="Odyssean Cuisses",augments={'Attack+16','"Store TP"+3','"Refresh"+2',}},
		feet={name="Odyssean Greaves",augments={'Accuracy+9 Attack+9','Enmity+1','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		neck="Coatl Gorget +1",
		left_ring="Stikini Ring +1",
	})
	sets.Idle.Refresh.Liberator = set_combine(sets.Idle.Refresh,{main="Liberator",sub="Utu grip"})
	sets.Idle.Refresh.Liberator.SAM = set_combine(sets.Idle.Refresh,{main="Liberator",sub="Utu grip"})
	sets.Idle.Refresh.Ragnarok = set_combine(sets.Idle.Refresh,{main="Ragnarok",sub="Utu grip"})
	sets.Idle.Refresh.Ragnarok.SAM = set_combine(sets.Idle.Refresh,{main="Ragnarok",sub="Utu grip"})
	sets.Idle.Refresh.Caladbolg = set_combine(sets.Idle.Refresh,{main="Caladbolg",sub="Utu grip"})
	sets.Idle.Refresh.Caladbolg.SAM = set_combine(sets.Idle.Refresh,{main="Caladbolg",sub="Utu grip"})
	sets.Idle.Refresh.Apocalypse = set_combine(sets.Idle.Refresh,{main="Apocalypse",sub="Utu grip"})
	sets.Idle.Refresh.Apocalypse.SAM = set_combine(sets.Idle.Refresh,{main="Apocalypse",sub="Utu grip"})
	sets.Idle.Refresh.Anguta = set_combine(sets.Idle.Refresh,{main="Anguta",sub="Utu grip"})
	sets.Idle.Refresh.Anguta.SAM = set_combine(sets.Idle.Refresh,{main="Anguta",sub="Utu grip"})
	sets.Idle.Refresh.Dacnomania = set_combine(sets.Idle.Refresh,{main="Dacnomania",sub="Utu grip"})
	sets.Idle.Refresh.Redemption = set_combine(sets.Idle.Refresh,{main="Redemption",sub="Utu grip"})
	
	-- Regain Sets --
	sets.Idle.Regain = set_combine(sets.Idle.PDT,{head="Ratri sallet",left_ring="Karieyh ring"})
	sets.Idle.Regain.Liberator = set_combine(sets.Idle.Regain,{main="Liberator",sub="Utu grip"})
	sets.Idle.Regain.Liberator.SAM = set_combine(sets.Idle.Regain,{main="Liberator",sub="Utu grip"})
	sets.Idle.Regain.Ragnarok = set_combine(sets.Idle.Regain,{main="Ragnarok",sub="Utu grip"})
	sets.Idle.Regain.Ragnarok.SAM = set_combine(sets.Idle.Regain,{main="Ragnarok",sub="Utu grip"})
	sets.Idle.Regain.Caladbolg = set_combine(sets.Idle.Regain,{main="Caladbolg",sub="Utu grip"})
	sets.Idle.Regain.Caladbolg.SAM = set_combine(sets.Idle.Regain,{main="Caladbolg",sub="Utu grip"})
	sets.Idle.Regain.Apocalypse = set_combine(sets.Idle.Regain,{main="Apocalypse",sub="Utu grip"})
	sets.Idle.Regain.Apocalypse.SAM = set_combine(sets.Idle.Regain,{main="Apocalypse",sub="Utu grip"})
	sets.Idle.Regain.Anguta = set_combine(sets.Idle.Regain,{main="Anguta",sub="Utu grip"})
	sets.Idle.Regain.Anguta.SAM = set_combine(sets.Idle.Regain,{main="Anguta",sub="Utu grip"})
	sets.Idle.Regain.Dacnomania = set_combine(sets.Idle.Regain,{main="Dacnomania",sub="Utu grip"})
	sets.Idle.Regain.Redemption = set_combine(sets.Idle.Regain,{main="Redemption",sub="Utu grip"})
	
	sets.Idle.MaxHP = {
		ammo="Egoist's Tathlum",
		head="Ratri Sallet",
		body="Ignominy Cuirass +3",
		hands="Ratri Gadlings",
		legs="Ratri Cuisses",
		feet="Ratri Sollerets",
		neck="Unmoving collar +1",
		waist="Oneiros Belt",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Moonbeam Ring",
		right_ring="Gelatinous ring +1",
		back="Moonlight Cape",
	}
	sets.Idle.MaxHP.Liberator = set_combine(sets.Idle.MaxHP,{main="Liberator",sub="Utu grip"})
	sets.Idle.MaxHP.Liberator.SAM = set_combine(sets.Idle.MaxHP,{main="Liberator",sub="Utu grip"})
	sets.Idle.MaxHP.Ragnarok = set_combine(sets.Idle.MaxHP,{main="Ragnarok",sub="Utu grip"})
	sets.Idle.MaxHP.Ragnarok.SAM = set_combine(sets.Idle.MaxHP,{main="Ragnarok",sub="Utu grip"})
	sets.Idle.MaxHP.Caladbolg = set_combine(sets.Idle.MaxHP,{main="Caladbolg",sub="Utu grip"})
	sets.Idle.MaxHP.Caladbolg.SAM = set_combine(sets.Idle.MaxHP,{main="Caladbolg",sub="Utu grip"})
	sets.Idle.MaxHP.Apocalypse = set_combine(sets.Idle.MaxHP,{main="Apocalypse",sub="Utu grip"})
	sets.Idle.MaxHP.Apocalypse.SAM = set_combine(sets.Idle.MaxHP,{main="Apocalypse",sub="Utu grip"})
	sets.Idle.MaxHP.Anguta = set_combine(sets.Idle.MaxHP,{main="Anguta",sub="Utu grip"})
	sets.Idle.MaxHP.Anguta.SAM = set_combine(sets.Idle.MaxHP,{main="Anguta",sub="Utu grip"})
	sets.Idle.MaxHP.Dacnomania = set_combine(sets.Idle.MaxHP,{main="Dacnomania",sub="Utu grip"})
	sets.Idle.MaxHP.Redemption = set_combine(sets.Idle.MaxHP,{main="Redemption",sub="Utu grip"})
	
	sets.Twilight = set_combine(sets.PDT,{head="Twilight Helm",body="Twilight Mail"})
	
	-- TP Base Set --
	sets.TP = {}
	
	-- Caladbolg /SAM TP Sets --
	sets.TP.Caladbolg = {
	main="Caladbolg",
		sub="Utu grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		-- body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		body="Dagon Breast.",
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Hetairoi Ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Caladbolg.SAM = {
		main="Caladbolg",
		sub="Utu grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		-- body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		body="Dagon Breast.",
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Hetairoi Ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Caladbolg.SAM.MidACC = set_combine(sets.TP.Caladbolg.SAM,{
		hands="Flam. Manopolas +2",
		left_ring="Flamma Ring",
		waist="Ioskeha belt +1",
	})
	sets.TP.Caladbolg.SAM.HighACC = set_combine(sets.TP.Caladbolg.SAM,{
		ammo="Seeth. Bomblet +1",
		body="Ignominy Cuirass +3",
		hands="Flam. Manopolas +2",
		left_ear="Telos Earring",
		right_ear="Digni. Earring",
		left_ring="Flamma Ring",
		right_ring="Regal Ring",
		}
	)
	
	-- Caladbolg(High Haste) /SAM TP Sets --
	sets.TP.Caladbolg.SAM.HighHaste = set_combine(sets.TP.Caladbolg.SAM,{
	waist="Windbuffet Belt +1"})
	sets.TP.Caladbolg.SAM.MidACC.HighHaste = set_combine(sets.TP.Caladbolg.SAM.HighHaste,{})
	sets.TP.Caladbolg.SAM.HighACC.HighHaste = set_combine(sets.TP.Caladbolg.SAM.MidACC.HighHaste,{})
	
	-- Caladbolg(Ionis) /SAM TP Sets --
	sets.TP.Caladbolg.SAM.Ionis = set_combine(sets.TP.Caladbolg.SAM,{})
	sets.TP.Caladbolg.SAM.MidACC.Ionis = set_combine(sets.TP.Caladbolg.SAM.Ionis,{})
	sets.TP.Caladbolg.SAM.HighACC.Ionis = set_combine(sets.TP.Caladbolg.SAM.MidACC.Ionis,{})
	
	-- Caladbolg(High Haste + Ionis) /SAM TP Sets --
	sets.TP.Caladbolg.SAM.HighHaste.Ionis = set_combine(sets.TP.Caladbolg.SAM.HighHaste,{})
	sets.TP.Caladbolg.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Caladbolg.SAM.HighHaste.Ionis,{})
	sets.TP.Caladbolg.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Caladbolg.SAM.MidACC.HighHaste.Ionis,{})
	
	-- Caladbolg(SAM Roll) /SAM TP Sets --
	sets.TP.Caladbolg.SAM.STP = set_combine(sets.TP.Caladbolg.SAM,{})
	sets.TP.Caladbolg.SAM.MidACC.STP = set_combine(sets.TP.Caladbolg.SAM.MidACC,{})
	sets.TP.Caladbolg.SAM.HighACC.STP = set_combine(sets.TP.Caladbolg.SAM.HighACC,{})
	
	-- Caladbolg(High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Caladbolg.SAM.HighHaste.STP = set_combine(sets.TP.Caladbolg.SAM.HighHaste,{})
	sets.TP.Caladbolg.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Caladbolg.SAM.MidACC.HighHaste,{})
	sets.TP.Caladbolg.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Caladbolg.SAM.HighACC.HighHaste,{})
	
	-- Caladbolg(Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Caladbolg.SAM.Ionis.STP = set_combine(sets.TP.Caladbolg.SAM.Ionis,{})
	sets.TP.Caladbolg.SAM.MidACC.Ionis.STP = set_combine(sets.TP.Caladbolg.SAM.MidACC.Ionis,{})
	sets.TP.Caladbolg.SAM.HighACC.Ionis.STP = set_combine(sets.TP.Caladbolg.SAM.HighACC.Ionis,{})
	
	-- Caladbolg(High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Caladbolg.SAM.HighHaste.Ionis.STP = set_combine(sets.TP.Caladbolg.SAM.HighHaste,{})
	sets.TP.Caladbolg.SAM.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Caladbolg.SAM.MidACC.HighHaste,{})
	sets.TP.Caladbolg.SAM.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Caladbolg.SAM.HighACC.HighHaste,{})
	
	-- Ragnarok TP Sets --
	sets.TP.Ragnarok = {
		main="Ragnarok",
		sub="Utu grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Hetairoi Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}					
	sets.TP.Ragnarok.MidACC = set_combine(sets.TP.Ragnarok,{
		hands="Flam. Manopolas +2",
		left_ring="Flamma Ring",
		waist="Ioskeha belt +1",
		}
	)
	sets.TP.Ragnarok.HighACC = set_combine(sets.TP.Ragnarok.MidACC,{
		ammo="Seeth. Bomblet +1",
		body="Ignominy Cuirass +3",
		hands="Flam. Manopolas +2",
		left_ear="Telos Earring",
		right_ear="Digni. Earring",
		left_ring="Flamma Ring",
		right_ring="Regal Ring",
		}
	)
	
	-- Ragnarok /SAM TP Sets --
	sets.TP.Ragnarok.SAM = {
		main="Ragnarok",
		sub="Utu grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Hetairoi Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Ragnarok.SAM.MidACC = set_combine(sets.TP.Ragnarok.SAM,{
		hands="Flam. Manopolas +2",
		left_ring="Flamma Ring",
		waist="Ioskeha belt +1",
		}
	)
	sets.TP.Ragnarok.SAM.HighACC = set_combine(sets.TP.Ragnarok.SAM.MidACC,{
		ammo="Seeth. Bomblet +1",
		body="Ignominy Cuirass +3",
		hands="Flam. Manopolas +2",
		left_ear="Telos Earring",
		right_ear="Digni. Earring",
		left_ring="Flamma Ring",
		right_ring="Regal Ring",
		}
	)
	
	-- Ragnarok(High Haste) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.HighHaste = set_combine(sets.TP.Ragnarok.SAM,{})
	sets.TP.Ragnarok.SAM.MidACC.HighHaste = set_combine(sets.TP.Ragnarok.SAM.HighHaste,{})
	sets.TP.Ragnarok.SAM.HighACC.HighHaste = set_combine(sets.TP.Ragnarok.SAM.MidACC.HighHaste,{})
	
	-- Ragnarok(Ionis) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.Ionis = set_combine(sets.TP.Ragnarok.SAM,{})
	sets.TP.Ragnarok.SAM.MidACC.Ionis = set_combine(sets.TP.Ragnarok.SAM.Ionis,{})
	sets.TP.Ragnarok.SAM.HighACC.Ionis = set_combine(sets.TP.Ragnarok.SAM.MidACC.Ionis,{})
	
	-- Ragnarok(High Haste + Ionis) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.HighHaste.Ionis = set_combine(sets.TP.Ragnarok.SAM.HighHaste,{})
	sets.TP.Ragnarok.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Ragnarok.SAM.HighHaste.Ionis,{})
	sets.TP.Ragnarok.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Ragnarok.SAM.MidACC.HighHaste.Ionis,{})
	
	-- Ragnarok(SAM Roll) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.STP = set_combine(sets.TP.Ragnarok.SAM,{})
	sets.TP.Ragnarok.SAM.MidACC.STP = set_combine(sets.TP.Ragnarok.SAM.MidACC,{})
	sets.TP.Ragnarok.SAM.HighACC.STP = set_combine(sets.TP.Ragnarok.SAM.HighACC,{})
	
	-- Ragnarok(High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.HighHaste.STP = set_combine(sets.TP.Ragnarok.SAM.HighHaste,{})
	sets.TP.Ragnarok.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Ragnarok.SAM.MidACC.HighHaste,{})
	sets.TP.Ragnarok.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Ragnarok.SAM.HighACC.HighHaste,{})
	
	-- Ragnarok(Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.Ionis.STP = set_combine(sets.TP.Ragnarok.SAM.Ionis,{})
	sets.TP.Ragnarok.SAM.MidACC.Ionis.STP = set_combine(sets.TP.Ragnarok.SAM.MidACC.Ionis,{})
	sets.TP.Ragnarok.SAM.HighACC.Ionis.STP = set_combine(sets.TP.Ragnarok.SAM.HighACC.Ionis,{})
	
	-- Ragnarok(High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Ragnarok.SAM.HighHaste.Ionis.STP = set_combine(sets.TP.Ragnarok.SAM.HighHaste,{})
	sets.TP.Ragnarok.SAM.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Ragnarok.SAM.MidACC.HighHaste,{})
	sets.TP.Ragnarok.SAM.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Ragnarok.SAM.HighACC.HighHaste,{})

	-- Scythe Builds
	-- Anguta TP Sets --
	sets.TP.Anguta = {
		main="Anguta",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Flamma Ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Anguta.MidACC = set_combine(sets.TP.Anguta,{})
	sets.TP.Anguta.HighACC = set_combine(sets.TP.Anguta.MidACC,{})
	
	-- Anguta(High Haste) TP Sets --
	sets.TP.Anguta.HighHaste = set_combine(sets.TP.Anguta,{})
	sets.TP.Anguta.MidACC.HighHaste = set_combine(sets.TP.Anguta.HighHaste,{})
	sets.TP.Anguta.HighACC.HighHaste = set_combine(sets.TP.Anguta.MidACC.HighHaste,{})
	
	-- Anguta(Ionis) TP Sets --
	sets.TP.Anguta.Ionis = set_combine(sets.TP.Anguta,{})
	sets.TP.Anguta.MidACC.Ionis = set_combine(sets.TP.Anguta.Ionis,{})
	sets.TP.Anguta.HighACC.Ionis = set_combine(sets.TP.Anguta.MidACC.Ionis,{})
	
	-- Anguta(High Haste + Ionis) TP Sets --
	sets.TP.Anguta.HighHaste.Ionis = set_combine(sets.TP.Anguta.HighHaste,{})
	sets.TP.Anguta.MidACC.HighHaste.Ionis = set_combine(sets.TP.Anguta.HighHaste.Ionis,{})
	sets.TP.Anguta.HighACC.HighHaste.Ionis = set_combine(sets.TP.Anguta.MidACC.HighHaste.Ionis,{})
	
	-- Anguta(SAM Roll) TP Sets --
	sets.TP.Anguta.STP = set_combine(sets.TP.Anguta,{})
	sets.TP.Anguta.MidACC.STP = set_combine(sets.TP.Anguta.MidACC,{})
	sets.TP.Anguta.HighACC.STP = set_combine(sets.TP.Anguta.HighACC,{})
	
	-- Anguta(High Haste + SAM Roll) TP Sets --
	sets.TP.Anguta.HighHaste.STP = set_combine(sets.TP.Anguta.HighHaste,{})
	sets.TP.Anguta.MidACC.HighHaste.STP = set_combine(sets.TP.Anguta.MidACC.HighHaste,{})
	sets.TP.Anguta.HighACC.HighHaste.STP = set_combine(sets.TP.Anguta.HighACC.HighHaste,{})
	
	-- Anguta(Ionis + SAM Roll) TP Sets --
	sets.TP.Anguta.Ionis.STP = set_combine(sets.TP.Anguta.Ionis,{})
	sets.TP.Anguta.MidACC.Ionis.STP = set_combine(sets.TP.Anguta.MidACC.Ionis,{})
	sets.TP.Anguta.HighACC.Ionis.STP = set_combine(sets.TP.Anguta.HighACC.Ionis,{})
	
	-- Anguta(High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Anguta.HighHaste.Ionis.STP = set_combine(sets.TP.Anguta.HighHaste,{})
	sets.TP.Anguta.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Anguta.MidACC.HighHaste,{})
	sets.TP.Anguta.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Anguta.HighACC.HighHaste,{})
	
	
	-- Anguta /SAM TP Sets --
	sets.TP.Anguta.SAM = {
		main="Anguta",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Hetairoi Ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Anguta.SAM.MidACC = set_combine(sets.TP.Anguta.SAM,{
		hands="Flam. Manopolas +2",
		waist="Ioskeha Belt +1",
		left_ring="Flamma Ring",
		}
	)
	sets.TP.Anguta.SAM.HighACC = set_combine(sets.TP.Anguta.SAM.MidACC,{})
	
	-- Anguta(High Haste) /SAM TP Sets --
	sets.TP.Anguta.SAM.HighHaste = set_combine(sets.TP.Anguta.SAM,{})
	sets.TP.Anguta.SAM.MidACC.HighHaste = set_combine(sets.TP.Anguta.SAM.HighHaste,{})
	sets.TP.Anguta.SAM.HighACC.HighHaste = set_combine(sets.TP.Anguta.SAM.MidACC.HighHaste,{})
	
	-- Anguta(Ionis) /SAM TP Sets --
	sets.TP.Anguta.SAM.Ionis = set_combine(sets.TP.Anguta.SAM,{})
	sets.TP.Anguta.SAM.MidACC.Ionis = set_combine(sets.TP.Anguta.SAM.Ionis,{})
	sets.TP.Anguta.SAM.HighACC.Ionis = set_combine(sets.TP.Anguta.SAM.MidACC.Ionis,{})
	
	-- Anguta(High Haste + Ionis) /SAM TP Sets --
	sets.TP.Anguta.SAM.HighHaste.Ionis = set_combine(sets.TP.Anguta.SAM.HighHaste,{})
	sets.TP.Anguta.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Anguta.SAM.HighHaste.Ionis,{})
	sets.TP.Anguta.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Anguta.SAM.MidACC.HighHaste.Ionis,{})
	
	-- Anguta(SAM Roll) /SAM TP Sets --
	sets.TP.Anguta.SAM.STP = set_combine(sets.TP.Anguta.SAM,{})
	sets.TP.Anguta.SAM.MidACC.STP = set_combine(sets.TP.Anguta.SAM.MidACC,{})
	sets.TP.Anguta.SAM.HighACC.STP = set_combine(sets.TP.Anguta.SAM.HighACC,{})
	
	-- Anguta(High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Anguta.SAM.HighHaste.STP = set_combine(sets.TP.Anguta.SAM.HighHaste,{})
	sets.TP.Anguta.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Anguta.SAM.MidACC.HighHaste,{})
	sets.TP.Anguta.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Anguta.SAM.HighACC.HighHaste,{})
	
	-- Anguta(Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Anguta.SAM.Ionis.STP = set_combine(sets.TP.Anguta.SAM.Ionis,{})
	sets.TP.Anguta.SAM.MidACC.Ionis.STP = set_combine(sets.TP.Anguta.SAM.MidACC.Ionis,{})
	sets.TP.Anguta.SAM.HighACC.Ionis.STP = set_combine(sets.TP.Anguta.SAM.HighACC.Ionis,{})
	
	-- Anguta(High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Anguta.SAM.HighHaste.Ionis.STP = set_combine(sets.TP.Anguta.SAM.HighHaste,{})
	sets.TP.Anguta.SAM.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Anguta.SAM.MidACC.HighHaste,{})
	sets.TP.Anguta.SAM.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Anguta.SAM.HighACC.HighHaste,{})

	-- Apocalypse(AM Down) TP Sets --
	sets.TP.Apocalypse = {
		main="Apocalypse",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Moonbeam Ring",
		right_ring="Chirich Ring +1",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Apocalypse.MidACC = set_combine(sets.TP.Apocalypse,{waist="Windbuffet belt +1",})
	sets.TP.Apocalypse.HighACC = set_combine(sets.TP.Apocalypse.MidACC,{})
	
	-- Apocalypse(AM Up) TP Sets --
	sets.TP.Apocalypse.AM = set_combine(sets.TP.Apocalypse,
		{
			ammo={name="Coiste Bodhar",augments={'Path: A',}},
			body="Dagon Breast.",
			left_ear={ name="Schere Earring", augments={'Path: A',}},
			right_ear="Brutal Earring",
			left_ring="Hetairoi Ring",
			back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		}
	)
	sets.TP.Apocalypse.MidACC.AM = set_combine(sets.TP.Apocalypse.AM,{})
	sets.TP.Apocalypse.HighACC.AM = set_combine(sets.TP.Apocalypse.MidACC.AM,{})
	
	-- Apocalypse(AM Down: High Haste) TP Sets --
	sets.TP.Apocalypse.HighHaste = set_combine(sets.TP.Apocalypse,{})
	sets.TP.Apocalypse.MidACC.HighHaste = set_combine(sets.TP.Apocalypse.HighHaste,{})
	sets.TP.Apocalypse.HighACC.HighHaste = set_combine(sets.TP.Apocalypse.MidACC.HighHaste,{})
	
	-- Apocalypse(AM Up: High Haste) TP Sets --
	sets.TP.Apocalypse.AM.HighHaste = set_combine(sets.TP.Apocalypse.AM,{})
	sets.TP.Apocalypse.MidACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.AM.HighHaste,{})
	sets.TP.Apocalypse.HighACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.MidACC.AM.HighHaste,{})
	
	-- Apocalypse(AM Down: Ionis) TP Sets --
	sets.TP.Apocalypse.Ionis = set_combine(sets.TP.Apocalypse,{})
	sets.TP.Apocalypse.MidACC.Ionis = set_combine(sets.TP.Apocalypse.Ionis,{})
	sets.TP.Apocalypse.HighACC.Ionis = set_combine(sets.TP.Apocalypse.MidACC.Ionis,{})
	
	-- Apocalypse(AM Up: Ionis) TP Sets --
	sets.TP.Apocalypse.AM.Ionis = set_combine(sets.TP.Apocalypse.AM,{})
	sets.TP.Apocalypse.MidACC.AM.Ionis = set_combine(sets.TP.Apocalypse.AM.Ionis,{})
	sets.TP.Apocalypse.HighACC.AM.Ionis= set_combine(sets.TP.Apocalypse.MidACC.AM.Ionis,{})
	
	-- Apocalypse(AM Down: High Haste + Ionis) TP Sets --
	sets.TP.Apocalypse.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.HighHaste,{})
	sets.TP.Apocalypse.MidACC.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.HighHaste.Ionis,{})
	sets.TP.Apocalypse.HighACC.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.MidACC.HighHaste.Ionis,{})
	
	-- Apocalypse(AM Up: High Haste + Ionis) TP Sets --
	sets.TP.Apocalypse.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.AM.HighHaste,{})
	sets.TP.Apocalypse.MidACC.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.AM.HighHaste.Ionis,{})
	sets.TP.Apocalypse.HighACC.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.MidACC.AM.HighHaste.Ionis,{})
	
	-- Apocalypse(AM Down: SAM Roll) TP Sets --
	sets.TP.Apocalypse.STP = set_combine(sets.TP.Apocalypse,{})
	sets.TP.Apocalypse.MidACC.STP = set_combine(sets.TP.Apocalypse.MidACC,{})
	sets.TP.Apocalypse.HighACC.STP = set_combine(sets.TP.Apocalypse.HighACC,{})
	
	-- Apocalypse(AM Up: SAM Roll) TP Sets --
	sets.TP.Apocalypse.AM.STP = set_combine(sets.TP.Apocalypse.AM,{})
	sets.TP.Apocalypse.MidACC.AM.STP = set_combine(sets.TP.Apocalypse.MidACC.AM,{})
	sets.TP.Apocalypse.HighACC.AM.STP = set_combine(sets.TP.Apocalypse.HighACC.AM,{})
	
	-- Apocalypse(AM Down: High Haste + SAM Roll) TP Sets --
	sets.TP.Apocalypse.HighHaste.STP = set_combine(sets.TP.Apocalypse.HighHaste,{})
	sets.TP.Apocalypse.MidACC.HighHaste.STP = set_combine(sets.TP.Apocalypse.MidACC.HighHaste,{})
	sets.TP.Apocalypse.HighACC.HighHaste.STP = set_combine(sets.TP.Apocalypse.HighACC.HighHaste,{})
	
	-- Apocalypse(AM Up: High Haste + SAM Roll) TP Sets --
	sets.TP.Apocalypse.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.HighHaste,{})
	sets.TP.Apocalypse.MidACC.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.MidACC.HighHaste,{})
	sets.TP.Apocalypse.HighACC.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.HighACC.HighHaste,{})
	
	-- Apocalypse(AM Down: Ionis + SAM Roll) TP Sets --
	sets.TP.Apocalypse.Ionis.STP = set_combine(sets.TP.Apocalypse.Ionis,{})
	sets.TP.Apocalypse.MidACC.Ionis.STP = set_combine(sets.TP.Apocalypse.MidACC.Ionis,{})
	sets.TP.Apocalypse.HighACC.Ionis.STP = set_combine(sets.TP.Apocalypse.HighACC.Ionis,{})
	
	-- Apocalypse(AM Up: Ionis + SAM Roll) TP Sets --
	sets.TP.Apocalypse.AM.Ionis.STP = set_combine(sets.TP.Apocalypse.AM,{})
	sets.TP.Apocalypse.MidACC.AM.Ionis.STP = set_combine(sets.TP.Apocalypse.MidACC.AM,{})
	sets.TP.Apocalypse.HighACC.AM.Ionis.STP = set_combine(sets.TP.Apocalypse.HighACC.AM,{})
	
	-- Apocalypse(AM Down: High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Apocalypse.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.HighHaste,{})
	sets.TP.Apocalypse.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.MidACC.HighHaste,{})
	sets.TP.Apocalypse.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.HighACC.HighHaste,{})
	
	-- Apocalypse(AM Up: High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Apocalypse.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.HighHaste,{})
	sets.TP.Apocalypse.MidACC.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.MidACC.HighHaste,{})
	sets.TP.Apocalypse.HighACC.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.HighACC.HighHaste,{})
	

	-- Apocalypse(AM Down) /SAM TP Sets --
	sets.TP.Apocalypse.SAM = {
		main="Apocalypse",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		-- neck={name="Abyssal Beads +2",augments={'Path: A',}},
		neck="Vim torque +1",
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Moonbeam Ring",
		right_ring="Chirich Ring +1",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Apocalypse.SAM.MidACC = set_combine(sets.TP.Apocalypse.SAM,{
		ammo="Seething Bomblet +1",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		hands={name="Argosy Mufflers +1",augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
		waist="Ioskeha belt +1",
		}
	)
	sets.TP.Apocalypse.SAM.HighACC = set_combine(sets.TP.Apocalypse.SAM.MidACC,{})
	
	-- Apocalypse(AM Up) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM = set_combine(sets.TP.Apocalypse.SAM,
		{
			ammo={name="Coiste Bodhar",augments={'Path: A',}},
			body="Dagon Breast.",
			left_ear={ name="Schere Earring", augments={'Path: A',}},
			right_ear="Brutal Earring",
			left_ring="Hetairoi Ring",
			right_ring="Niqmaddu Ring",
			back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		}
	)
	sets.TP.Apocalypse.SAM.MidACC.AM = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.HighACC.AM = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM,{})
	
	-- Apocalypse(AM Down: High Haste) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.HighHaste = set_combine(sets.TP.Apocalypse.SAM,{})
	sets.TP.Apocalypse.SAM.MidACC.HighHaste = set_combine(sets.TP.Apocalypse.SAM.HighHaste,{}	)
	sets.TP.Apocalypse.SAM.HighACC.HighHaste = set_combine(sets.TP.Apocalypse.SAM.MidACC.HighHaste,{})
	
	-- Apocalypse(AM Up: High Haste) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.HighHaste = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.SAM.AM.HighHaste,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste,{})
	
	-- Apocalypse(AM Down: Ionis) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.Ionis = set_combine(sets.TP.Apocalypse.SAM,{})
	sets.TP.Apocalypse.SAM.MidACC.Ionis = set_combine(sets.TP.Apocalypse.SAM.Ionis,{})
	sets.TP.Apocalypse.SAM.HighACC.Ionis = set_combine(sets.TP.Apocalypse.SAM.MidACC.Ionis,{})
	
	-- Apocalypse(AM Up: Ionis) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.Ionis = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.Ionis = set_combine(sets.TP.Apocalypse.SAM.AM.Ionis,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.Ionis = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM.Ionis,{})
	
	-- Apocalypse(AM Down: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.HighHaste,{})
	sets.TP.Apocalypse.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.HighHaste.Ionis,{})
	sets.TP.Apocalypse.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.MidACC.HighHaste.Ionis,{})
	
	-- Apocalypse(AM Up: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.AM.HighHaste,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.AM.HighHaste.Ionis,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.HighHaste.Ionis = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste.Ionis,{})
	
	-- Apocalypse(AM Down: SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.STP = set_combine(sets.TP.Apocalypse.SAM,{})
	sets.TP.Apocalypse.SAM.MidACC.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC,{})
	sets.TP.Apocalypse.SAM.HighACC.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC,{})
	
	-- Apocalypse(AM Up: SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.STP = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.AM,{})
	
	-- Apocalypse(AM Down: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.HighHaste,{})
	sets.TP.Apocalypse.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.HighHaste,{})
	sets.TP.Apocalypse.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.HighHaste,{})
	
	-- Apocalypse(AM Up: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.HighHaste,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.HighHaste,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.HighHaste,{})
	
	-- Apocalypse(AM Down: Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.Ionis,{})
	sets.TP.Apocalypse.SAM.MidACC.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.Ionis,{})
	sets.TP.Apocalypse.SAM.HighACC.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.Ionis,{})
	
	-- Apocalypse(AM Up: Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.AM,{})
	
	-- Apocalypse(AM Down: High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.HighHaste,{})
	sets.TP.Apocalypse.SAM.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.HighHaste,{})
	sets.TP.Apocalypse.SAM.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.HighHaste,{})
	
	-- Apocalypse(AM Up: High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.HighHaste,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.HighHaste,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.HighHaste,{})
	
	-- Liberator TP Sets --
	sets.TP.Liberator = {
		main="Liberator",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		-- head="Flam. Zucchetto +2",
		head="Hjarrandi helm",
		-- body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		body="Hjarrandi breastplate",
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		-- left_ring="Flamma Ring",
		-- right_ring="Niqmaddu Ring",
		left_ring="Regal ring",
		right_ring="Chirich ring +1",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Liberator.MidACC = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.HighACC = set_combine(sets.TP.Liberator.MidACC,{})
	
	-- Liberator(High Haste) TP Sets --
	sets.TP.Liberator.HighHaste = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.MidACC.HighHaste = set_combine(sets.TP.Liberator.HighHaste,{})
	sets.TP.Liberator.HighACC.HighHaste = set_combine(sets.TP.Liberator.MidACC.HighHaste,{})
	
	-- Liberator(Ionis) TP Sets --
	sets.TP.Liberator.Ionis = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.MidACC.Ionis = set_combine(sets.TP.Liberator.Ionis,{})
	sets.TP.Liberator.HighACC.Ionis = set_combine(sets.TP.Liberator.MidACC.Ionis,{})
	
	-- Liberator(High Haste + Ionis) TP Sets --
	sets.TP.Liberator.HighHaste.Ionis = set_combine(sets.TP.Liberator.HighHaste,{})
	sets.TP.Liberator.MidACC.HighHaste.Ionis = set_combine(sets.TP.Liberator.HighHaste.Ionis,{})
	sets.TP.Liberator.HighACC.HighHaste.Ionis = set_combine(sets.TP.Liberator.MidACC.HighHaste.Ionis,{})
	
	-- Liberator(SAM Roll) TP Sets --
	sets.TP.Liberator.STP = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.MidACC.STP = set_combine(sets.TP.Liberator.MidACC,{})
	sets.TP.Liberator.HighACC.STP = set_combine(sets.TP.Liberator.HighACC,{})
	
	-- Liberator(High Haste + SAM Roll) TP Sets --
	sets.TP.Liberator.HighHaste.STP = set_combine(sets.TP.Liberator.HighHaste,{})
	sets.TP.Liberator.MidACC.HighHaste.STP = set_combine(sets.TP.Liberator.MidACC.HighHaste,{})
	sets.TP.Liberator.HighACC.HighHaste.STP = set_combine(sets.TP.Liberator.HighACC.HighHaste,{})
	
	-- Liberator(Ionis + SAM Roll) TP Sets --
	sets.TP.Liberator.Ionis.STP = set_combine(sets.TP.Liberator.Ionis,{})
	sets.TP.Liberator.MidACC.Ionis.STP = set_combine(sets.TP.Liberator.MidACC.Ionis,{})
	sets.TP.Liberator.HighACC.Ionis.STP = set_combine(sets.TP.Liberator.HighACC.Ionis,{})
	
	-- Liberator(High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Liberator.HighHaste.Ionis.STP = set_combine(sets.TP.Liberator.HighHaste,{})
	sets.TP.Liberator.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Liberator.MidACC.HighHaste,{})
	sets.TP.Liberator.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Liberator.HighACC.HighHaste,{})
	
	
	-- Liberator /SAM TP Sets --
	sets.TP.Liberator.SAM = {
		main="Liberator",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		-- head="Flam. Zucchetto +2",
		head="Hjarrandi helm",
		-- body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		body="Hjarrandi breastplate",
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		-- left_ring="Flamma Ring",
		-- right_ring="Niqmaddu Ring",
		left_ring="Regal ring",
		right_ring="Chirich ring +1",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Liberator.SAM.MidACC = set_combine(sets.TP.Liberator.SAM,{
		hands="Flam. Manopolas +2",
		waist="Ioskeha Belt +1",
		left_ring="Flamma Ring",
		}
	)
	sets.TP.Liberator.SAM.HighACC = set_combine(sets.TP.Liberator.SAM.MidACC,{})
	
	-- Liberator(High Haste) /SAM TP Sets --
	sets.TP.Liberator.SAM.HighHaste = set_combine(sets.TP.Liberator.SAM,{})
	sets.TP.Liberator.SAM.MidACC.HighHaste = set_combine(sets.TP.Liberator.SAM.HighHaste,{})
	sets.TP.Liberator.SAM.HighACC.HighHaste = set_combine(sets.TP.Liberator.SAM.MidACC.HighHaste,{})
	
	-- Liberator(Ionis) /SAM TP Sets --
	sets.TP.Liberator.SAM.Ionis = set_combine(sets.TP.Liberator.SAM,{})
	sets.TP.Liberator.SAM.MidACC.Ionis = set_combine(sets.TP.Liberator.SAM.Ionis,{})
	sets.TP.Liberator.SAM.HighACC.Ionis = set_combine(sets.TP.Liberator.SAM.MidACC.Ionis,{})
	
	-- Liberator(High Haste + Ionis) /SAM TP Sets --
	sets.TP.Liberator.SAM.HighHaste.Ionis = set_combine(sets.TP.Liberator.SAM.HighHaste,{})
	sets.TP.Liberator.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Liberator.SAM.HighHaste.Ionis,{})
	sets.TP.Liberator.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Liberator.SAM.MidACC.HighHaste.Ionis,{})
	
	-- Liberator(SAM Roll) /SAM TP Sets --
	sets.TP.Liberator.SAM.STP = set_combine(sets.TP.Liberator.SAM,{})
	sets.TP.Liberator.SAM.MidACC.STP = set_combine(sets.TP.Liberator.SAM.MidACC,{})
	sets.TP.Liberator.SAM.HighACC.STP = set_combine(sets.TP.Liberator.SAM.HighACC,{})
	
	-- Liberator(High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Liberator.SAM.HighHaste.STP = set_combine(sets.TP.Liberator.SAM.HighHaste,{})
	sets.TP.Liberator.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Liberator.SAM.MidACC.HighHaste,{})
	sets.TP.Liberator.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Liberator.SAM.HighACC.HighHaste,{})
	
	-- Liberator(Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Liberator.SAM.Ionis.STP = set_combine(sets.TP.Liberator.SAM.Ionis,{})
	sets.TP.Liberator.SAM.MidACC.Ionis.STP = set_combine(sets.TP.Liberator.SAM.MidACC.Ionis,{})
	sets.TP.Liberator.SAM.HighACC.Ionis.STP = set_combine(sets.TP.Liberator.SAM.HighACC.Ionis,{})
	
	-- Liberator(High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Liberator.SAM.HighHaste.Ionis.STP = set_combine(sets.TP.Liberator.SAM.HighHaste,{})
	sets.TP.Liberator.SAM.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Liberator.SAM.MidACC.HighHaste,{})
	sets.TP.Liberator.SAM.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Liberator.SAM.HighACC.HighHaste,{})
	
	sets.TP.Dacnomania = {
		main="Dacnomania",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body={name="Valorous Mail",augments={'Accuracy+24','"Store TP"+7','Attack+15',}},
		hands="Flam. Manopolas +2",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Flamma Ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}					
	sets.TP.Dacnomania.MidACC = set_combine(sets.TP.Dacnomania,{})					
	sets.TP.Dacnomania.HighACC = set_combine(sets.TP.Dacnomania.MidACC,{})
	
	-- Dacnomania(High Haste) TP Sets --
	sets.TP.Dacnomania.HighHaste = set_combine(sets.TP.Dacnomania,{})
	sets.TP.Dacnomania.MidACC.HighHaste = set_combine(sets.TP.Dacnomania.HighHaste,{})
	sets.TP.Dacnomania.HighACC.HighHaste = set_combine(sets.TP.Dacnomania.MidACC.HighHaste,{})
	
	-- Dacnomania(Ionis) TP Sets --
	sets.TP.Dacnomania.Ionis = set_combine(sets.TP.Dacnomania,{})
	sets.TP.Dacnomania.MidACC.Ionis = set_combine(sets.TP.Dacnomania.Ionis,{})
	sets.TP.Dacnomania.HighACC.Ionis = set_combine(sets.TP.Dacnomania.MidACC.Ionis,{})
	
	-- Dacnomania(High Haste + Ionis) TP Sets --
	sets.TP.Dacnomania.HighHaste.Ionis = set_combine(sets.TP.Dacnomania.HighHaste,{})
	sets.TP.Dacnomania.MidACC.HighHaste.Ionis = set_combine(sets.TP.Dacnomania.HighHaste.Ionis,{})
	sets.TP.Dacnomania.HighACC.HighHaste.Ionis = set_combine(sets.TP.Dacnomania.MidACC.HighHaste.Ionis,{})
	-- Dacnomania(SAM Roll) TP Sets --
	sets.TP.Dacnomania.STP = set_combine(sets.TP.Dacnomania,{})
	sets.TP.Dacnomania.MidACC.STP = set_combine(sets.TP.Dacnomania.STP,{})
	sets.TP.Dacnomania.HighACC.STP = set_combine(sets.TP.Dacnomania.MidACC.STP,{})
	
	-- Dacnomania(High Haste + SAM Roll) TP Sets --
	sets.TP.Dacnomania.HighHaste.STP = set_combine(sets.TP.Dacnomania.HighHaste,{})
	sets.TP.Dacnomania.MidACC.HighHaste.STP = set_combine(sets.TP.Dacnomania.HighHaste.STP,{})
	sets.TP.Dacnomania.HighACC.HighHaste.STP = set_combine(sets.TP.Dacnomania.MidACC.HighHaste.STP,{})
	
	-- Dacnomania(Ionis + SAM Roll) TP Sets --
	sets.TP.Dacnomania.Ionis.STP = set_combine(sets.TP.Dacnomania.Ionis,{})
	sets.TP.Dacnomania.MidACC.Ionis.STP = set_combine(sets.TP.Dacnomania.MidACC.Ionis,{})
	sets.TP.Dacnomania.HighACC.Ionis.STP = set_combine(sets.TP.Dacnomania.HighACC.Ionis,{})
	
	-- Dacnomania(High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Dacnomania.HighHaste.Ionis.STP = set_combine(sets.TP.Dacnomania.HighHaste,{})
	sets.TP.Dacnomania.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Dacnomania.MidACC.HighHaste,{})
	sets.TP.Dacnomania.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Dacnomania.HighACC.HighHaste,{})
	
	-- Redemption TP Sets --
	sets.TP.Redemption = {
		main="Redemption",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body="Dagon Breast.",
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		-- left_ear="Telos Earring",
		-- right_ear="Cessance Earring",
		left_ear="Brutal earring",
		right_ear="Schere earring",		
		-- left_ring="Flamma Ring",
		left_ring="Hetairoi ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Redemption.MidACC = set_combine(sets.TP.Redemption,{})
	sets.TP.Redemption.HighACC = set_combine(sets.TP.Redemption.MidACC,{})
	
	-- Redemption(High Haste) TP Sets --
	sets.TP.Redemption.HighHaste = set_combine(sets.TP.Redemption,{})
	sets.TP.Redemption.MidACC.HighHaste = set_combine(sets.TP.Redemption.HighHaste,{})
	sets.TP.Redemption.HighACC.HighHaste = set_combine(sets.TP.Redemption.MidACC.HighHaste,{})
	
	-- Redemption(Ionis) TP Sets --
	sets.TP.Redemption.Ionis = set_combine(sets.TP.Redemption,{})
	sets.TP.Redemption.MidACC.Ionis = set_combine(sets.TP.Redemption.Ionis,{})
	sets.TP.Redemption.HighACC.Ionis = set_combine(sets.TP.Redemption.MidACC.Ionis,{})
	
	-- Redemption(High Haste + Ionis) TP Sets --
	sets.TP.Redemption.HighHaste.Ionis = set_combine(sets.TP.Redemption.HighHaste,{})
	sets.TP.Redemption.MidACC.HighHaste.Ionis = set_combine(sets.TP.Redemption.HighHaste.Ionis,{})
	sets.TP.Redemption.HighACC.HighHaste.Ionis = set_combine(sets.TP.Redemption.MidACC.HighHaste.Ionis,{})
	
	-- Redemption(SAM Roll) TP Sets --
	sets.TP.Redemption.STP = set_combine(sets.TP.Redemption,{})
	sets.TP.Redemption.MidACC.STP = set_combine(sets.TP.Redemption.MidACC,{})
	sets.TP.Redemption.HighACC.STP = set_combine(sets.TP.Redemption.HighACC,{})
	
	-- Redemption(High Haste + SAM Roll) TP Sets --
	sets.TP.Redemption.HighHaste.STP = set_combine(sets.TP.Redemption.HighHaste,{})
	sets.TP.Redemption.MidACC.HighHaste.STP = set_combine(sets.TP.Redemption.MidACC.HighHaste,{})
	sets.TP.Redemption.HighACC.HighHaste.STP = set_combine(sets.TP.Redemption.HighACC.HighHaste,{})
	
	-- Redemption(Ionis + SAM Roll) TP Sets --
	sets.TP.Redemption.Ionis.STP = set_combine(sets.TP.Redemption.Ionis,{})
	sets.TP.Redemption.MidACC.Ionis.STP = set_combine(sets.TP.Redemption.MidACC.Ionis,{})
	sets.TP.Redemption.HighACC.Ionis.STP = set_combine(sets.TP.Redemption.HighACC.Ionis,{})
	
	-- Redemption(High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Redemption.HighHaste.Ionis.STP = set_combine(sets.TP.Redemption.HighHaste,{})
	sets.TP.Redemption.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Redemption.MidACC.HighHaste,{})
	sets.TP.Redemption.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Redemption.HighACC.HighHaste,{})
	
	
	-- Redemption /SAM TP Sets --
	sets.TP.Redemption.SAM = {
		main="Redemption",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body="Dagon Breast.",
		hands="Sakpata's Gauntlets",
		legs="Ig. Flanchard +3",
		feet="Flam. Gambieras +2",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		-- left_ear="Telos Earring",
		-- right_ear="Cessance Earring",
		left_ear="Brutal earring",
		right_ear="Schere earring",		
		-- left_ring="Flamma Ring",
		left_ring="Hetairoi ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.TP.Redemption.SAM.MidACC = set_combine(sets.TP.Redemption.SAM,{})
	sets.TP.Redemption.SAM.HighACC = set_combine(sets.TP.Redemption.SAM.MidACC,{})
	
	-- Redemption(High Haste) /SAM TP Sets --
	sets.TP.Redemption.SAM.HighHaste = set_combine(sets.TP.Redemption.SAM,{})
	sets.TP.Redemption.SAM.MidACC.HighHaste = set_combine(sets.TP.Redemption.SAM.HighHaste,{})
	sets.TP.Redemption.SAM.HighACC.HighHaste = set_combine(sets.TP.Redemption.SAM.MidACC.HighHaste,{})
	
	-- Redemption(Ionis) /SAM TP Sets --
	sets.TP.Redemption.SAM.Ionis = set_combine(sets.TP.Redemption.SAM,{})
	sets.TP.Redemption.SAM.MidACC.Ionis = set_combine(sets.TP.Redemption.SAM.Ionis,{})
	sets.TP.Redemption.SAM.HighACC.Ionis = set_combine(sets.TP.Redemption.SAM.MidACC.Ionis,{})
	
	-- Redemption(High Haste + Ionis) /SAM TP Sets --
	sets.TP.Redemption.SAM.HighHaste.Ionis = set_combine(sets.TP.Redemption.SAM.HighHaste,{})
	sets.TP.Redemption.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Redemption.SAM.HighHaste.Ionis,{})
	sets.TP.Redemption.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Redemption.SAM.MidACC.HighHaste.Ionis,{})
	
	-- Redemption(SAM Roll) /SAM TP Sets --
	sets.TP.Redemption.SAM.STP = set_combine(sets.TP.Redemption.SAM,{})
	sets.TP.Redemption.SAM.MidACC.STP = set_combine(sets.TP.Redemption.SAM.MidACC,{})
	sets.TP.Redemption.SAM.HighACC.STP = set_combine(sets.TP.Redemption.SAM.HighACC,{})
	
	-- Redemption(High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Redemption.SAM.HighHaste.STP = set_combine(sets.TP.Redemption.SAM.HighHaste,{})
	sets.TP.Redemption.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Redemption.SAM.MidACC.HighHaste,{})
	sets.TP.Redemption.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Redemption.SAM.HighACC.HighHaste,{})
	
	-- Redemption(Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Redemption.SAM.Ionis.STP = set_combine(sets.TP.Redemption.SAM.Ionis,{})
	sets.TP.Redemption.SAM.MidACC.Ionis.STP = set_combine(sets.TP.Redemption.SAM.MidACC.Ionis,{})
	sets.TP.Redemption.SAM.HighACC.Ionis.STP = set_combine(sets.TP.Redemption.SAM.HighACC.Ionis,{})
	
	-- Redemption(High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Redemption.SAM.HighHaste.Ionis.STP = set_combine(sets.TP.Redemption.SAM.HighHaste,{})
	sets.TP.Redemption.SAM.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Redemption.SAM.MidACC.HighHaste,{})
	sets.TP.Redemption.SAM.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Redemption.SAM.HighACC.HighHaste,{})
	
	-- AM3 Rancor ON Mantle --
	sets.TP.Rancor = {}
	
	-- PDT/MDT Sets --
	sets.PDT = {
		ammo="Staunch Tathlum +1",
		head="Sulevia's Mask +2",
		body="Heath. Cuirass +2",
		hands="Heath. Gauntlets +2",
		legs="Heath. Flanchard +2",
		feet="Sulev. Leggings +2",
		neck="Loricate Torque +1",
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Karieyh Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
	}
	
	sets.MDT = set_combine(sets.PDT,{
		ammo="Staunch Tathlum +1",
		head="Sulevia's Mask +2",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
		body="Heath. Cuirass +2",
		hands="Heath. Gauntlets +2",
		legs="Heath. Flanchard +2",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		feet="Sulev. Leggings +2"
		}
	)
	
	sets.Scarlet = set_combine(sets.PDT,{
		ear1="Cessance Earring",
		ear2="Ishvara Earring",
		-- back="Rancorous Mantle",
		waist="Gishdubar Sash",
		}
	)
	
	-- Hybrid Set --
	sets.TP.Hybrid = set_combine(sets.PDT,{
		ammo="Seething Bomblet +1",
		head="Sulevia's Mask +2",
		neck="Loricate Torque +1",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		body="Sulevia's Plate. +2",
		hands="Sulev. Gauntlets +2",
		ring1="Niqmaddu ring",
		ring2="Defending Ring",
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		back={name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
		}
	)
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{ring1="Cacoethic ring +1"})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})
	
	-- WS Base Set --
	sets.WS = {
		ammo="Knobkierrie",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body="Ignominy Cuirass +3",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
		feet="Heath. Sollerets +3",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Thrud Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring",
		back={name="Ankou's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	-- Resolution Sets --
	sets.WS.Resolution = {
		ammo="Seeth. Bomblet +1",
		head="Flam. Zucchetto +2",
		body="Ignominy Cuirass +3",
		-- hands={name="Argosy Mufflers +1",augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
		hands="Sakpata's Gauntlets",
		legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
		feet="Flam. Gambieras +2",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Brutal Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{})
	sets.WS.Resolution.MaxACC = set_combine(sets.WS.Resolution.HighACC,{})
	
	-- Torcleaver Sets --
	sets.WS.Torcleaver = {
		ammo="Knobkierrie",
		-- head="Ratri Sallet",
		head="Nyame helm",
		body="Ignominy Cuirass +3",
		hands="Nyame gauntlets",
		legs={name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
		feet="Heath. Sollerets +3",
		neck="Abyssal bead necklace +2",
		waist="Fotia Belt",
		left_ear={name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Thrud Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
	}
	sets.WS.Torcleaver.MidACC = set_combine(sets.WS.Torcleaver,{
		ammo="Seething Bomblet +1",
		-- ring2="Supershear Ring",
		}
	)
	sets.WS.Torcleaver.HighACC = set_combine(sets.WS.Torcleaver.MidACC,{
		ammo="Seething Bomblet +1",
		neck="Abyssal bead necklace +2",
		ear1="Telos earring",
		ear2="Moonshade Earring",
		body="Ignominy Cuirass +3",
		back={name="Ankou's Mantle",augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Heath. Sollerets +3"
		}
	)
	sets.WS.Torcleaver.MaxACC = set_combine(sets.WS.Torcleaver.HighACC,{})
	
	-- Scourge Sets --
	sets.WS.Scourge = {
		ammo="Knobkierrie",
		head="Nyame helm",
		body="Ignominy Cuirass +3",
		hands="Nyame gauntlets",
		legs="Nyame Flanchard",
		feet="Heath. Sollerets +3",
		neck="Abyssal bead necklace +2",
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		ear1="Thrud Earring",ear2="Lugra Earring +1",
		ring1="Epaminondas's Ring",ring2="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.Scourge.MidACC = set_combine(sets.WS.Scourge,{})
	sets.WS.Scourge.HighACC = set_combine(sets.WS.Scourge.MidACC,{})							
	
	-- Resolution(Attack) Set --
	sets.WS.Resolution.ATT = set_combine(sets.WS.Resolution,{})
	
	-- Catastrophe Sets --
	sets.WS.Catastrophe = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",
		-- body="Ignominy Cuirass +3",
		body="Nyame mail",
		hands={name="Nyame Gauntlets",augments={'Path: B',}},
		legs={name="Fall. Flanchard +3",augments={'Enhances "Muted Soul" effect',}},
		feet="Heath. Sollerets +3",
		neck="Abyssal bead necklace +2",
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear="Thrud Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.Catastrophe.MidACC = set_combine(sets.WS.Catastrophe,{})
	sets.WS.Catastrophe.HighACC = set_combine(sets.WS.Catastrophe.MidACC,{})
	sets.WS.Catastrophe.MaxACC = set_combine(sets.WS.Catastrophe.MidACC,{})
	
	-- Catastrophe(Attack) Set --
	sets.WS.Catastrophe.ATT = set_combine(sets.WS.Catastrophe,{})
	
	-- Entropy Sets --
	sets.WS.Entropy = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",
		body="Dagon Breast.",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Ig. Flanchard +3",
		feet="Heath. Sollerets +3",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear={ name="Schere Earring", augments={'Path: A',}},
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'INT+20','Accuracy+20 Attack+20','INT+10','"Dbl.Atk."+10',}},
	}
	--  TESTING ENTROPY BUILDS 
	--  More INT (+17), less Attack (-31, Even Accuarcy (-1), & Even Dbl.Atk (-2)
	sets.WS.Entropy.MidACC = set_combine(sets.WS.Entropy, {
		neck="Fotia Gorget",
		left_ring="Karieyh ring",
		}
	)
	-- sets.WS.Entropy.MidACC = set_combine(sets.WS.Entropy,{})
	sets.WS.Entropy.HighACC = set_combine(sets.WS.Entropy.MidACC,{})
	
	-- CrossReaper Sets --
	sets.WS['Cross Reaper'] = {
		head="Heath. Bur. +3",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Heath. Sollerets +3",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Thrud Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS['Cross Reaper'].MidACC = set_combine(sets.WS['Cross Reaper'],{})
	sets.WS['Cross Reaper'].HighACC = set_combine(sets.WS['Cross Reaper'].MidACC,{})							

	-- Quietus Sets --
	sets.WS.Quietus = {
		ammo="Knobkierrie",
		head="Ratri Sallet",
		body="Ignominy Cuirass +3",
		-- hands="Ratri Gadlings",
		hands="Nyame gauntlets",
		-- legs="Ratri Cuisses",
		legs={name="Fall. Flanchard +3",augments={'Enhances "Muted Soul" effect',}},
		feet="Heath. Sollerets +3",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear={name="Moonshade Earring",augments={'Attack+4','TP Bonus +250',}},
		right_ear="Thrud Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.Quietus.MidACC = set_combine(sets.WS.Quietus,{})
	sets.WS.Quietus.HighACC = set_combine(sets.WS.Quietus.MidACC,{})							

	-- Entropy(Attack) Set --
	sets.WS.Entropy.ATT = set_combine(sets.WS.Entropy,{})
	
	-- Insurgency Sets --
	sets.WS.Insurgency = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",
		body="Ignominy Cuirass +3",
		hands="Sakpata's Gauntlets",
		legs="Ignominy Flanchard +3",
		feet="Heath. Sollerets +3",
		neck={name="Abyssal Beads +2",augments={'Path: A',}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		left_ear={name="Moonshade Earring",augments={'Attack+4','TP Bonus +250',}},
		right_ear="Thrud Earring",
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={name="Ankou's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.Insurgency.MidACC = set_combine(sets.WS.Insurgency,{})
	sets.WS.Insurgency.HighACC = set_combine(sets.WS.Insurgency.MidACC,{})
	
	sets.WS['Infernal Scythe'] = {
		ammo="Knobkierrie",
		-- ammo="Crepuscular pebble",
		head="Pixie Hairpin +1",
		-- body="Ignominy Cuirass +3",
		body="Fall. Cuirass +3",
		hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
		legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
		feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
		neck="Abyssal bead necklace +2",
		-- waist="Eschan stone",
		waist="Orpheus's sash",
		left_ear="Friomisi Earring",
		right_ear="Hermetic Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Archon Ring",
		back={name="Ankou's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	-- JA Sets --
	sets.JA = {}
	sets.JA["Blood Weapon"]		= {body="Fallen's Cuirass +3"}
	sets.JA["Diabolic Eye"]		= {hands="Fall. Fin. Gaunt. +3"}
	sets.JA["Weapon Bash"]		= {hands="Ignominy Gauntlets +3"}
	sets.JA["Nether Void"]		= {legs="Heath. Flanchard +2"}
	sets.JA["Arcane Circle"]	= {feet="Ig. Sollerets +3"}
	sets.JA["Last Resort"]		= {back="Ankou's Mantle",feet="Fall. Sollerets +3"}
	
	-- Waltz Set --
	sets.Waltz = {}
	
	-- Fastcast Set --
	sets.Precast = {}
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		head={name="Carmine Mask +1",augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body={name="Fall. Cuirass +3",augments={'Enhances "Blood Weapon" effect',}},
		hands={name="Leyline Gloves",augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Enif Cosciales",
		feet={name="Odyssean Greaves",augments={'"Store TP"+3','INT+12','"Fast Cast"+6','Accuracy+20 Attack+20',}},
		neck="Orunmila's Torque",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={name="Ankou's Mantle",augments={'HP+60','Mag. Acc+20 /Mag. Dmg.+20','HP+20','"Fast Cast"+10',}},
	}
	
	-- Precast Dark Magic --
	sets.Precast['Dark Magic'] = set_combine(sets.Precast.FastCast,{
		head="Carmine Mask +1",
		-- head="Fall. Burgeonet +3",
		}
	)
	
	-- Midcast Base Set --
	sets.Midcast = {
		ammo="Impatiens",
		head="Carmine Mask +1",
		neck="Orunmila's Torque",
		ear1="Loquac. Earring",
		ear2="Malignance Earring",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Lebeche Ring",
		back={name ="Ankou's Mantle", augments={'INT +20'}},
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		legs="Eschite Cuisses",
		feet={name="Odyssean Greaves",augments={'"Store TP"+3','INT+12','"Fast Cast"+6','Accuracy+20 Attack+20',}},
	}
	
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{
		ammo="Impatiens",
		head="Carmine Mask +1",
		neck="Orunmila's Torque",
		ear1="Loquac. Earring",
		ear2="Malignance Earring",
		body="Heath. cuirass +2",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Lebeche Ring",
		waist={name="Sailfi Belt +1",augments={'Path: A',}},
		legs="Eschite Cuisses",
		feet="Heath. Sollerets +3"
		}
	)
	
	-- Dark Magic Set --
	sets.Midcast['Dark Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Ig. Burgeonet +3",
		body="Carm. Sc. Mail +1",
		hands={name="Fall. Fin. Gaunt. +3",augments={'Enhances "Diabolic Eye" effect',}},
		legs="Heath. Flanchard +2",
		feet="Ig. Sollerets +3",
		neck="Erra Pendant",
		waist="Casso Sash",
		left_ear="Mani Earring",
		right_ear="Dark Earring",
		left_ring={name="Metamor. Ring +1",augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back={name="Niht Mantle",augments={'Attack+10','Dark magic skill +10','"Drain" and "Aspir" potency +23',}},
	}
	
	-- Absorb Set --
	sets.Midcast.Absorb = {
		ammo="Pemphredo Tathlum",
		head="Ig. Burgeonet +3",
		body="Carm. Sc. Mail +1",
		hands={name="Fall. Fin. Gaunt. +3",augments={'Enhances "Diabolic Eye" effect',}},
		legs={name="Eschite Cuisses",augments={'Mag. Evasion+15','Spell interruption rate down +15%','Enmity+7',}},
		feet="Ratri Sollerets",
		neck="Erra Pendant",
		waist="Casso Sash",
		left_ear="Mani Earring",
		right_ear="Dark Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={name="Niht Mantle",augments={'Attack+10','Dark magic skill +10','"Drain" and "Aspir" potency +23',}},
	}
	sets.Midcast.Absorb.MidACC = set_combine(sets.Midcast.Absorb,{}	)
	sets.Midcast.Absorb.HighACC = set_combine(sets.Midcast.Absorb.MidACC,{})
	sets.Midcast.Absorb.MaxACC = set_combine(sets.Midcast.Absorb.HighACC,{})
	
	-- Absorb-TP Set --
	sets.Midcast['Absorb-TP'] = set_combine(sets.Midcast.Absorb,{hands="Heathen's Gauntlets +2"})
	
	-- Stun Sets --
	sets.Midcast.Stun = {
		ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",
		neck="Erra Pendant",
		ear1="Malignance Earring",
		ear2="Dignitary's Earring",
		body="Carm. Sc. Mail +1",
		hands="Leyline Gloves",
		ring1="Sangoma ring",
		ring2="Evanescence Ring",
		back={name ="Ankou's Mantle", augments={'INT +20'}},
		waist="Eschan Stone",
		legs="Eschite Cuisses",
		feet="Heath. Sollerets +3"
	}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})
	
	-- Endark Set --
	sets.Midcast['Endark'] =  set_combine(sets.Midcast['Dark Magic'], {
		feet="Ratri Sollerets",
		}
	)
	sets.Midcast['Endark II'] = sets.Midcast['Endark']
	
	-- Enfeebling Magic Set --
	sets.Midcast['Enfeebling Magic'] = {
		ammo="Pemphredo Tathlum",
		head={name="Carmine Mask +1",augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body="Ignominy Cuirass +3",
		hands={name="Leyline Gloves",augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Heath. Flanchard +2",
		feet="Veikr Pumps",
		neck="Incanter's Torque",
		waist="Eschan Stone",
		left_ear="Digni. Earring",
		right_ear="Malignance Earring",
		left_ring={name="Metamor. Ring +1",augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back={name="Ankou's Mantle",augments={'HP+60','Mag. Acc+20 /Mag. Dmg.+20','HP+20','"Fast Cast"+10',}},
	}
	
	-- Elemental Magic Set --
	sets.Midcast['Elemental Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",
		neck="Incanter's Torque",
		ear1="Malignance Earring",
		ear2="Digni. Earring",
		body="Carm. Sc. Mail +1",
		hands="Leyline Gloves",
		ring1="Sangoma ring",
		ring2="Evanescence Ring",
		back={name="Ankou's Mantle",augments={'INT +20'}},
		waist="Eschan Stone",
		legs="Eschite Cuisses",
		feet="Heath. Sollerets +3"
	}
	
	-- Dread Spikes Set --
	sets.Midcast['Dread Spikes'] = set_combine(sets.Idle.MaxHP,{body="Heathen's cuirass +2"})
	
	sets.Midcast['Drain'] = {
		ammo="Pemphredo Tathlum",
		head="Fall. Burgeonet +3",
		neck="Erra Pendant",
		ear1="Hirudinea Earring",
		ear2="Dignitary's Earring",
		body="Carm. Sc. Mail +1",
		hands="Fall. Fin. Gaunt. +3",
		ring1="Archon Ring",
		ring2="Evanescence Ring",
		back={name="Niht Mantle",augments={'Attack+10','Dark magic skill +10','"Drain" and "Aspir" potency +23',}},
		-- waist="Austerity Belt +1",
		waist="Eschan stone",
		legs="Fall. Flanchard +3",
		feet="Ig. Sollerets +3"
	}
	sets.Midcast['Drain II'] = set_combine(sets.Midcast['Drain'], {})
	sets.Midcast['Drain III'] = set_combine(sets.Midcast['Drain'], {
		feet="Ratri sollerets",
		}
	)
	organizer_items = {
		echos="Echo Drops",
		food="Sublime Sushi",
		food="Red Curry Bun"
	}
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
		elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
		elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
		elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
		elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
		elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
			elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
			elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
			elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
			elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
			elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
			elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		equipSet = sets.WS
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		end
		if Attack == 'ON' then
			equipSet = equipSet["ATT"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if elements[spell.name] and elements[spell.name]:contains(world.day_element) then
			equipSet = set_combine(equipSet,elements.equip)
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if (spell.english == "Entropy" or spell.english == "Resolution" or spell.english == "Insurgency") and (player.tp > 2990 or buffactive.Sekkanoki) then
			if world.time <= (7*60) or world.time >= (17*60) then -- 3000 TP or Sekkanoki: Equip Lugra Earring +1 From Dusk To Dawn --
				equipSet = set_combine(equipSet,{ear1="Lugra Earring +1"})
				else
				equipSet = set_combine(equipSet,{ear1="Bale Earring"}) -- 3000 TP or Sekkanoki: Equip Kokou's Earring --
			end
		end
		equip(equipSet)
		
		elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
		elseif spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
			else
			if spell.english == "Stun" then
				if buffactive.Hasso or buffactive.Seigan then -- Cancel Hasso or Seigan When You Use Stun --
					cast_delay(0.2)
					send_command('cancel Hasso,Seigan')
				end
				equip(sets.Precast.FastCast)
				elseif spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
					return
					else
					equip(sets.Precast.FastCast)
				end
				elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
				else
				equip(sets.Precast.FastCast)
			end
		end
		elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
		elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if spell.english:startswith('Absorb') and spell.english ~= "Absorb-TP" then
			equipSet = sets.Midcast.Absorb
			elseif spell.english:startswith('Drain') or spell.english:startswith('Aspir') or spell.english:startswith('Bio') then
			if world.day == "Darksday" or world.weather_element == "Dark" then -- Equip Hachirin-no-Obi On Darksday or Dark Weather --
				equipSet = set_combine(equipSet,{waist="Anrin Obi"})
			end
			-- equipSet = sets.Midcast['Dark Magic']
			equipSet = sets.Midcast['Drain']
			elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 1.7;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
			elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
			elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
			elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
			else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
		end
		elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	if buffactive["Dark Seal"] and DSIndex==0 then -- Equip Aug'd Fall. Burgeonet +1 When You Have Dark Seal Up --
		equipSet = set_combine(equipSet,{head="Fall. Burgeonet +3"})
	end
	equip(equipSet)
end

function aftercast(spell,action)
	
	if spell.type == "WeaponSkill" then
		send_command('wait 0.2;gs c TP')
		elseif spell.english == "Arcane Circle" then -- Arcane Circle Countdown --
		send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		elseif spell.english == "Sleep II" then -- Sleep II Countdown --
		send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" then -- Sleep Countdown --
		send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
	end
	status_change(player.status)
end


function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
		elseif Armor == 'MDT' then
		equip(sets.MDT)
		elseif Armor == 'Scarlet' then
		equip(sets.Scarlet)
		elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
	    if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
			if buffactive["Last Resort"] and ((buffactive.Haste and buffactive.March == 2) or (buffactive.Embrava and (buffactive.March == 2 or (buffactive.March and buffactive.Haste) or (buffactive.March and buffactive['Mighty Guard']) or (buffactive['Mighty Guard'] and buffactive.Haste))) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava or buffactive['Mighty Guard']))) and equipSet["HighHaste"] then
				equipSet = equipSet["AM3_HighHaste"]
    			elseif Rancor == 'ON' then -- Default Rancor Toggle Is Rancorous Mantle --
				equipSet = set_combine(equipSet["AM3"],sets.TP.Rancor)
    			else -- Use Rancor Toggle For Atheling Mantle --
				equipSet = equipSet["AM3"]
			end
		end	
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive["Last Resort"] and ((buffactive.Haste and buffactive.March == 2) or (buffactive.Embrava and (buffactive.March == 2 or (buffactive.March and buffactive.Haste) or (buffactive.March and buffactive['Mighty Guard']) or (buffactive['Mighty Guard'] and buffactive.Haste))) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava or buffactive['Mighty Guard']))) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		--[[
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		]]--
		if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
			equipSet = equipSet["STP"]
		end
		equip(equipSet)
		else
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		equip(equipSet)
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
			else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
		elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
			else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Berserker's Torque"})
		else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
		elseif command == 'Weapon' then -- Main Weapon Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Main Weapon: '..WeaponArray[WeaponIndex])
		status_change(player.status)
		elseif command == 'Update' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(050,'Auto Update Gear: ['..WeaponArray[WeaponIndex]..'] TP: ['..AccArray[AccIndex]..'] Idle: ['..IdleArray[IdleIndex]..']')
		elseif command == 'Hybrid' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
			else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
		elseif command == 'C10' then -- DarkSeal Toggle --
        if DarkSealIndex == 1 then
			DarkSealIndex = 0
			add_to_chat(158,'DarkSeal Duration: [On]')
			else
			DarkSealIndex = 1
			add_to_chat(158,'DarkSeal Potency: [On]')
		end
        status_change(player.status)
		elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
			else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
		elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
			else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
		elseif command == 'C9' then -- Scarlet Toggle --
		if Armor == 'Scarlet' then
			Armor = 'None'
			add_to_chat(123,'Scarlet Set: [Unlocked]')
			else
			Armor = 'Scarlet'
			add_to_chat(158,'Scarlet Set: [Locked]')
		end
		status_change(player.status)
		elseif command == 'C16' then -- Rancor Toggle --
		if Rancor == 'ON' then
			Rancor = 'OFF'
			add_to_chat(123,'Rancor: [OFF]')
			else
			Rancor = 'ON'
			add_to_chat(158,'Rancor: [ON]')
		end
		status_change(player.status)
		elseif command == 'C' then -- Attack Toggle --
		if Attack == 'ON' then
			Attack = 'OFF'
			add_to_chat(123,'Attack: [OFF]')
			else
			Attack = 'ON'
			add_to_chat(158,'Attack: [ON]')
		end
		status_change(player.status)
		elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 'Twilight' then
			Twilight = 'None'
			add_to_chat(123,'Twilight Set: [Unlocked]')
			else
			Twilight = 'Twilight'
			add_to_chat(158,'Twilight Set: [locked]')
		end
		status_change(player.status)
		elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
			else
			add_to_chat(123,'No Target Selected')
		end
		elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
		elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])

	elseif command == 'finale' then
		send_command('input //send Cyre gs c dispel')
	elseif command == 'horde' then
		send_command('input //send Cyre gs c sleepga')
	elseif command == 'elegy' then
		send_command('input //send Cyre input /magic "Carnage Elegy" <bt>')
	-- Escha Temp Items
	elseif command == 'doom' then
		send_command('input /item "Savior\'s Tonic" <me>')
		add_to_chat(158, 'Doom Screen: Savior\'s Tonic')
	elseif command == 'charm' then
		send_command('input /item "Charm buffer" <me>')
		add_to_chat(158, 'Charm Screen: Charm Buffer')
	elseif command == 'charmed' then
		send_command('input //send Cyre input /magic "Foe Lullaby" Odude')
		add_to_chat(158,'ODUDE CHARMED')
	elseif command == 'terror' then
		send_command('input /item "Steadfast Tonic" <me>')
		add_to_chat(158,'Terror Screen: Steadfast Tonic')	
	elseif command == 'amnesia' then
		send_command('input /item "Moneta\'s Tonic" <me>')
		add_to_chat(158,'Amnesia Screen: Moneta\'s Tonic')
	elseif command == 'petrify' then
		send_command('input /item "Mirror\'s Tonic" <me>')
		add_to_chat(158,'Petrify Screen: Mirror\'s Tonic')
	elseif command == 'clerics' then
		send_command('input /item "Cleric\'s Drink" <me>')
		add_to_chat(158,'Cleric\'s Drink')
	elseif command == 'vicars' then
		send_command('input /item "Vicar\'s Drink" <me>')
		add_to_chat(158,'Vicar\'s Drink')
	elseif command == 'bravers' then
		send_command('input /item "Braver\'s Drink" <me>')
		add_to_chat(158,'Braver\'s Drink')
	elseif command == 'regain' then
		send_command('input /item "Monarch\'s Drink" <me>')
		add_to_chat(158,'Monarch\'s Drink')
	elseif command == 'tp1' then
		send_command('input /item "Lucid Wings I" <me>')
		add_to_chat(158,'Lucid Wing - 1')
	elseif command == 'tp2' then
		send_command('input /item "Lucid Wings II" <me>')
		add_to_chat(158,'Lucid Wing - 2')
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
		elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
		else
		enable('ring1','ring2','back')
	end
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end
	
	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" then
		return
	end
	
	local newWaltz = spell.english
	local waltzID
	
	local missingHP
	
	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
		elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end
	
	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
				elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
				elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
				else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
			else
			return
		end
	end
	
	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50}
	local tpCost = waltzTPCost[newWaltz]
	
	local downgrade
	
	if player.tp < tpCost then
		
		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
			elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
			elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		end
		
		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end
	
	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(8, downgrade)
		end
		cancel_spell()
		return
	end
	
	if missingHP > 0 then
		add_to_chat(8,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end
	
	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
		else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 2)
		elseif player.sub_job == 'SAM' then
		set_macro_page(2, 2)
		elseif player.sub_job == 'NIN' then
		set_macro_page(3, 2)
		elseif player.sub_job == 'DNC' then
		set_macro_page(9, 2)
		elseif player.sub_job == 'SCH' then
		set_macro_page(8, 2)
		else
		set_macro_page(1, 2)
	end
end