function user_setup()

	sets.precast.JA['Arcane Circle']	= {feet="Ignominy Sollerets +1"}
	sets.precast.JA['Blood Weapon']		= {body="Fallen's Cuirass"}
	sets.precast.JA['Dark Seal']		= {head="Fallen's Burgeonet"}
	sets.precast.JA['Diabolic Eye']		= {hands="Fallen's finger gauntlets +1"}
	sets.precast.JA['Last Resort']		= {back="Ankou's mantle"}
	sets.precast.JA['Nether Void']		= {legs="Heathen's Flanchard +1"}
	sets.precast.JA['Souleater']		= {head="Ignominy burgeonet +1"}
	sets.precast.JA['Weapon Bash']		= {hands="Ignominy Gauntlets +1"}
	sets.precast.JA['Consume Mana']		= {}
	sets.precast.JA['Arcane Crest']		= {}
	sets.precast.JA['Scarlet Delirium']	= {}
	sets.precast.JA['Soul Enslavement']	= {}
	
	
	sets.precast.FC = {
		ammo="Impatiens",head="Cizin helm +1",body="Nuevo coselete",hands="Leyline gloves",legs="Enif Cosciales",neck="Orunmila's Torque",ring1="Prolix Ring",ear1="Etiolation earring",ear2="Loquac. Earring"
	}
	sets.midcast.MagicAcc = {
		ammo="Plumrose sachet",body="Corselet",hands="Sulevia's gauntlets +1",legs="Eschite cuisses",feet="Heathen's sollerets +1",ring1="Omega ring",ring2="Balrahn's ring"
	}
	sets.midcast.MaxHaste = {
		head="Acro helm",hands="Heathen's gauntlets +1",legs="Ares' Flanchard +1",feet="Flamma gambieras +1",waist="Ioskeha belt"
	}
	sets.midcast.sTP = {
		ammo="Hagneia stone",head="Sulevia's mask +1",body="Armada hauberk",hands="Flamma manopolas +1",legs="Ker's flanchard",feet="Flamma gambieras +1",neck="Lissome necklace",ear1="Bladeborn earring",ear2="Steelflash earring",waist="Goading belt"
	}
	sets.midcast.Trust = {
		head="Sulevia's mask +1",body="Sulevia's platemail +1",hands="Sulevia's gauntlets +1",legs="Sulevia's cuisses +1",feet="Sulevia's leggings +2"
	}
	sets.midcast.DarkMagic = {
		ammo="Plumrose sachet",head="Igno. Burgeonet +1",body="Demon's Harness",hands="Fallen's finger gauntlets +1",
		legs={name="Eschite Cuisses",augments={'MP+80','Accuracy+10','Enmity+7',}},neck="Deceiver's Torque",waist="Casso Sash",left_ear="Dark Earring",back="Merciful Cape"
	}
	sets.midcast['Elemental Magic'] = set_combine(sets.midcast.sTP, {
			neck="Aesir torque",back="Merciful cape"
		}
	)
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.MagicAcc, {
			body="Ignominy cuirass +1",feet="Abyss Sollerets",neck="Melic torque", waist="Casso sash"
		}
	)
	sets.midcast['Stun'] = set_combine(sets.midcast.DarkMagic, {
			head="Cizin helm +1",body="Nuevo coselete",hands="Fallen's finger gauntlets +1",legs="Enif cosciales",feet="Heathen's sollerets +1",back="Merciful cape",neck="Orunmila's torque",ear2="Loquac. Earring",waist="Ioskeha belt",ring1="Prolix ring",ring2="Balrahn's Ring",ammo="Plumrose sachet"
		}
	)
	sets.midcast['Endark'] =  sets.midcast.DarkMagic
	sets.midcast['Endark II'] =  sets.midcast.DarkMagic
	sets.midcast['Dread Spikes'] = {
		head={name="Fallen's Burgeonet +1",augments={'Enhances "Dark Seal" effect',}},body="Heath. Cuirass +1",hands="Ares' Gauntlets +1",legs="Ares' Flanchard +1",
		feet="Igno. Sollerets +1",waist="Ioskeha Belt",left_ear="Etiolation earring",left_ring="Meridian Ring",ammo="Plumrose sachet"
	}
	sets.midcast['Absorb-TP'] = set_combine(sets.midcast.DarkMagic, {
			body="Corselet",hands="Heathen's gauntlets +1",feet="Heathen's sollerets +1",ring1="Omega Ring",ring2="Balrahn's Ring",ammo="Plumrose sachet"
		}
	)
	sets.midcast['Drain'] = set_combine(sets.midcast.DarkMagic, {
			body="Corselet",hands="Fallen's finger gauntlets +1.",feet="Heathen's sollerets +1",ring1="Omega Ring",ring2="Balrahn's Ring",ammo="Plumrose sachet"
		}
	)
	sets.midcast['Drain III'] = set_combine(sets.midcast.DarkMagic, {
			body="Corselet",hands="Fallen's finger gauntlets +1.",feet="Heathen's sollerets +1",ring1="Omega Ring",ring2="Balrahn's Ring",ammo="Plumrose sachet"
		}
	)
	sets.midcast['Aspir'] = sets.midcast['Drain']
	sets.midcast.Bio = set_combine(sets.midcast.DarkMagic, {
			head="Sulevia's mask +1",body="Armada hauberk",legs="Phorcys dirs",feet="Heathen's sollerets +1",ammo="Hagneia Stone",ring1="Tyrant's ring",ring2="Rajas Ring",ear1="Bladeborn Earring",neck="Lissome necklace"
		}
	)
	sets.midcast['Utsusemi'] = sets.midcast.MaxHaste

	sets.idle.Town = {
		head="Fancy spectacles",body="Sulevia's platemail +1",hands="Sulevia's gauntlets +1",legs={name="Blood Cuisses",augments={'"Fast Cast"+4','Evasion+6','Mag. Evasion+6',}},feet="Sulevia's leggings +2",neck="Wiglen gorget",ring1="Sheltered Ring",ring2="Karieyh ring",back={name="Ankou's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	}
	sets.idle.Field = {
		head="Twilight Helm",body="Twilight mail",hands="Sulevia's gauntlets +1",legs="Blood Cuisses",feet="Phorcys schuhs",neck="Wiglen gorget",back="Impasive mantle",ring1="Jelly Ring",ring2="Karieyh ring",ammo="Brigantia pebble"
	}
	sets.idle.Weak = set_combine(sets.idle.Field, {
		head="Twilight Helm",body="Twilight mail"
	})

	sets.defense.PDT = {
		head="Heathen's burgonet +1",body="Mekira meikogai",hands="Sulevia's gauntlets +1",legs="Ogier's Breeches",feet="Phorcys schuhs",back="Impasive mantle",neck="Wiglen gorget",ring1="Jelly ring",ring2="Dark Ring",ammo="Brigantia pebble"
	}
	sets.defense.Reraise = set_combine(sets.defense.PDT, {
			head="Twilight Helm",body="Twilight Mail"
		}
	)
	sets.Doom = {
		head="Twilight Helm",body="Twilight Mail"
	}
	sets.defense.MDT = {
		ammo="",head="",body="",hands="",legs="",feet="",
		back="Letalis Mantle",
		waist="Ioskeha Belt",neck="Twilight torque",
		ring1="Tyrant's ring",ring2="Rajas Ring",
		ear1="Bladeborn Earring",ear2="Steelflash Earring"
	}

	
	sets.Kiting = {legs="Blood Cuisses"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.Fishing = {
		head="Fancy Spectacles",body="Fisherman's Apron",hands="Angler's Gloves",legs="Angler's Hose",feet="Angler's Boots",
		left_ring="Noddy Ring",right_ring="Puffin Ring",
	}
	

		
		
	end