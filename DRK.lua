    -------------------------------------------------------------------------------------------------------------------
    -- Initialization function that defines sets and variables to be used.
    -------------------------------------------------------------------------------------------------------------------
     
    -- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
     
    -- Initialization function for this job file.
    function get_sets()
			-- mote_include_version = 2
            -- Load and initialize the include file.
            include('Mote-Include.lua')
    end
     
     
    -- Setup vars that are user-independent.
    function job_setup()
                    state.Buff['Aftermath'] = buffactive['Aftermath: Lv.1'] or
                    buffactive['Aftermath: Lv.2'] or
                    buffactive['Aftermath: Lv.3']
                    or false
    end
     
     
    -- Setup vars that are user-dependent.  Can override this function in a sidecar file.
    function user_setup()

		state.OffenseMode:options('Normal', 'Acc', 'Multi')
		state.HybridMode:options('Normal', 'Acc', 'PDT')
		state.WeaponskillMode:options('Normal', 'Acc', 'Att', 'Mod')
		state.CastingMode:options('Normal', 'Acc')
		state.IdleMode:options('Normal', 'Weak')
		state.RestingMode:options('Normal')
		state.PhysicalDefenseMode:options('PDT', 'Reraise')
		state.MagicalDefenseMode:options('MDT')
			
		adjust_engaged_sets()
		select_default_macro_book()
    end
     
    -- Called when this job file is unloaded (eg: job change)
    function file_unload()
		send_command('unbind ^`')
		send_command('unbind !=')
		send_command('unbind ^[')
		send_command('unbind ![')
		send_command('unbind @f9')
    end
     
           
    -- Define sets and vars used by this job file.
    function init_gear_sets()

						                   
            -- Weaponskill sets
            -- Default set for any weaponskill that isn't any more specifically defined
            sets.precast.WS = {ammo="Fracas grenade",
				head="Ignominy burgeonet +1",body="Phorcys korazin",hands="Phorcys mitts",legs="Eschite cuisses",feet="Heathen's sollerets",
				back="Niht mantle",ear1="Bale Earring",ear2="Brutal Earring",ring1="Pyrosoul ring",ring2="Ifrit ring +1"
			}
            sets.precast.WS.Acc = set_combine(sets.precast.WS, {back="Letalis Mantle"})
     
            -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
            sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {head="Heathen's burgonet +1",neck="Soil Gorget",waist="Soil belt",ammo="Bomb core",back="Niht mantle"})
            sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {neck="Soil Gorget",waist="Soil belt",ammo="Fire bomblet"})
            sets.precast.WS['Catastrophe'].Mod = set_combine(sets.precast.WS['Catastrophe'], {neck="Soil Gorget",waist="Soil belt"})
     
            sets.precast.WS['Entropy'] = {ammo="Fire bomblet",
					head="Ignominy burgeonet +1",body="Phorcys korazin",hands="Phorcys mitts",legs="Eschite cuisses", feet="Heathen's sollerets",
					back="Letalis mantle",neck="Soil gorget",waist="Soil belt",ear1="Brutal earring",ear2="Moonshade earring",ring1="Spiral ring",
					ring2="Rajas ring"
			}
            sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {neck="Soil Gorget",legs="Cizin Breeches"})
            sets.precast.WS['Entropy'].Mod = set_combine(sets.precast.WS['Entropy'], {waist="Soil Belt",legs="Cizin Breeches"})
     
            sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Soil belt"})
            sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {neck="Soil Gorget",ring2="Candent Ring"})
            sets.precast.WS['Resolution'].Mod = set_combine(sets.precast.WS['Resolution'], {waist="Soil Belt",ring2="Candent Ring"})
     
			sets.precast.WS['Torcleaver'] = {
				head="Ignominy burgeonet +1",body="Phorcys korazin",hands="Heathen's gauntlets +1",legs="Eschite cuisses",feet="Dilaram's Sollerets",
				ammo="Brigantia pebble",back="Niht mantle",waist="Light belt",neck="Light gorget",ear1="Brutal earring",ear2="Moonshade earring",
				ring1="Spiral ring",ring2="Terrasoul ring"
			}
			
			sets.precast.WS['Scourge'] = {
				head="Ignominy burgeonet +1",body="Phorcys korazin",hands="Phorcys mitts",legs="Eschite cuisses",feet="Dilaram's Sollerets",
				waist="Light belt",neck="Light gorget",ear1="Bale Earring",ear2="Brutal Earring",
				ring1="Spiral ring",ring2="Terrasoul ring",ammo="Brigantia pebble",back="Niht mantle"
			}
		
            -- Sets to return to when not performing an action.
           
            -- Resting sets
            sets.resting = {head="Twilight helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Loquacious Earring",
                    body="Twilight mail",hands="Cizin Mufflers",ring1="Sheltered Ring",ring2="Paguroidea Ring",
                    back="Metallon Mantle",legs="Blood Cuisses",feet="Phorcys schuhs"}
           
     

           
            -- Defense sets
            sets.defense.PDT = {
                    head="Cizin Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Cizin Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
                    back="Mollusca Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Phorcys schuhs"}
     
            sets.defense.Reraise = {
                    head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Twilight Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Paguroidea Ring",
                    back="Mollusca Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
     
            sets.defense.MDT = {
                    head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Cizin Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
                    back="Engulfer Cape",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
     
	sets.Kiting = {legs="Blood Cuisses"}     
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
     
            -- Engaged sets
	sets.engaged = {ammo="Hagneia Stone",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Goading Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
	sets.engaged.Acc = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
	sets.engaged = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Windbuffet Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
	sets.engaged.Multi = {ammo="Hagneia Stone",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Cetl Belt",legs="Cizin Breeches",feet="Ejekamal Boots"}
	sets.engaged.Reraise = {ammo="Fire Bomblet",
		head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Twilight Mail",hands="Cizin Muffler",ring1="Dark Ring",ring2="Dark Ring",
		back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
	
	 
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion
           
            -- Normal melee group
            sets.engaged.Apocalypse = {ammo="Hagneia stone",
                    head="Heathen's burgonet +1",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Armada hauberk",hands="Redan gloves",ring1="Tyrant's Ring",ring2="Rajas Ring",
                    back="Atheling Mantle",waist="Dynamic Belt +1",legs="Ares' flanchard +1",feet="Mikinaak greaves"}
            sets.engaged.Apocalypse.Acc = {ammo="Fire bomblet",
                    head="Heathen's burgonet +1",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Emet harness +1",hands="Redan gloves",ring1="Tyrant's Ring",ring2="Rajas Ring",
                    back="Letalis Mantle",waist="Dynamic Belt +1",legs="Heathen's Flanchard",feet="Mikinaak greaves"}
            sets.engaged.Apocalypse.AM = {ammo="Fire bomblet",
                    head="Heathen's burgonet +1",neck="Ganesha's mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Vatic byrnie",hands="Redan gloves",ring1="Tyrant's Ring",ring2="Rajas Ring",
                    back="Letalis Mantle",waist="Windbuffet Belt",legs="Eschite cuisses",feet="Mikinaak greaves"}
            sets.engaged.Apocalypse.Multi = {ammo="Hagneia Stone",
                    head="Otomi Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
                    back="Letalis Mantle",waist="Windbuffet Belt",legs="Cizin Breeches",feet="Ejekamal Boots"}
            sets.engaged.Apocalypse.Multi.PDT = {ammo="Hagneia Stone",
                    head="Yaoyotl Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Cizin Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Graves"}
            sets.engaged.Apocalypse.Multi.Reraise = {ammo="Hagneia Stone",
                    head="Twilight Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Twilight Breastplate",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="Mars's Ring",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Ejekamal Boots"}
            sets.engaged.Apocalypse.PDT = {ammo="Fire Bomblet",
                    head="Cizin Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Cizin Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
                    back="Mollusca Mantle",waist="Nierenschutz",legs="Cizin Breeches",feet="Cizin Greaves"}
            sets.engaged.Apocalypse.Acc.PDT = {ammo="Fire Bomblet",
                    head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Cizin Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
            sets.engaged.Apocalypse.Reraise = {ammo="Fire Bomblet",
                    head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Twilight Mail",hands="Cizin Muffler",ring1="Dark Ring",ring2="Dark Ring",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
            sets.engaged.Apocalypse.Acc.Reraise = {ammo="Fire Bomblet",
                    head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Twilight Mail",hands="Cizin Muffler",ring1="Dark Ring",ring2="DarkRing",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Greaves"}
					
			sets.engaged.Caladbolg = {ammo="Hagneia stone",
                    head="Heathen's burgonet +1",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Armada hauberk",hands="Redan gloves",ring1="Tyrant's Ring",ring2="Rajas Ring",
                    back="Atheling Mantle",waist="Dynamic Belt +1",legs="Ares' flanchard +1",feet="Mikinaak greaves"}
					
			sets.engaged['Lotus katana'] = set_combine(sets.engaged.Caladbolg, {
				head="Kengo hachimaki",ear1="Bushinomimi",ear2="Brutal earring",back="Letalis mantle",ammo="Fire bomblet"
			})
			
			sets.engaged.Gkt = set_combine(sets.engaged, {
				head="Kengo hachimaki",ear1="Bushinomimi",back="Letalis mantle"
			})
					
            -- Custom Melee Group
            sets.engaged.Ragnarok = {ammo="Hagneia stone",
                    head="Ignominy burgeonet +1",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Armada hauberk",hands="Heathen's gauntlets +1",ring1="Tyrant's Ring",ring2="Rajas Ring",
                    back="Letalis Mantle",waist="Dynamic Belt +1",legs="Eschite cuisses",feet="Mikinaak greaves"}
            sets.engaged.Ragnarok.Acc = {ammo="Hagneia Stone",
                    head="Yaoyotl Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Mikinaak Breastplate",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="Mars's Ring",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
            sets.engaged.Ragnarok.Multi = {ammo="Hagneia Stone",
                    head="Otomi Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Mikinaak Breastplate",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
                    back="Letalis Mantle",waist="Goading Belt",legs="Cizin Breeches",feet="Ejekamal Boots"}
            sets.engaged.Ragnarok.Multi.PDT = {ammo="Hagneia Stone",
                    head="Yaoyotl Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Cizin Mail",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="Mars's Ring",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Cizin Graves"}
            sets.engaged.Ragnarok.Multi.Reraise = {ammo="Hagneia Stone",
                    head="Twilight Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Pak Corselet",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="Mars's Ring",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Ejekamal Boots"}
            sets.engaged.Ragnarok.PDT = {ammo="Hagneia Stone",
                    head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Mikinaak Breastplate",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
                    back="Mollusca Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
            sets.engaged.Ragnarok.Acc.PDT = {ammo="Hagneia Stone",
                    head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Mikinaak Breastplate",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
                    back="Mollusca Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
            sets.engaged.Ragnarok.Reraise = {ammo="Hagneia Stone",
                    head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Twilight Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
            sets.engaged.Ragnarok.Acc.Reraise = {ammo="Hagneia Stone",
                    head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
                    body="Twilight Mail",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
                    back="Letalis Mantle",waist="Dynamic Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
     
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Job-specific hooks that are called to process player actions at specific points in time.
    -------------------------------------------------------------------------------------------------------------------
     
  
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    -- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
    function job_precast(spell)
            if spell.action_type == 'Magic' then
            equip(sets.precast.FC)
            end
    end




    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    function job_midcast(spell, action, spellMap, eventArgs)
            if spell.action_type == 'Magic' then
                equip(sets.midcast.FastRecast)
            end
    end
	
    
    -- Run after the default midcast() is done.
    -- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
    function job_post_midcast(spell, action, spellMap, eventArgs)
            if state.DefenseMode == 'Reraise' or
                    (state.Defense.Active and state.Defense.Type == 'Physical' and state.Defense.PhysicalMode == 'Reraise') then
                    equip(sets.Reraise)
            end
    end
     
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
  --  function job_aftercast(spell, action, spellMap, eventArgs)
  --      if not spell.interrupted then
  --              if state.Buff[spell.english] ~= nil then
  --                      state.Buff[spell.english] = true
  --              end
  --       end
  --  end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Customization hooks for idle and melee sets, after they've been automatically constructed.
    -------------------------------------------------------------------------------------------------------------------
    -- Modify the default idle set after it was constructed.
    function customize_idle_set(idleSet)
            return idleSet
    end
     
    -- Modify the default melee set after it was constructed.
    function customize_melee_set(meleeSet)
            return meleeSet
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- General hooks for other events.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Called when the player's status changes.
    function job_status_change(newStatus, oldStatus, eventArgs)
     
    end
     
    -- Called when a player gains or loses a buff.
    -- buff == buff gained or lost
    -- gain == true if the buff was gained, false if it was lost.
    function job_buff_change(buff, gain)
            if buff:startswith('Aftermath') then
                state.Buff.Aftermath = gain
                adjust_melee_groups()
                handle_equipping_gear(player.status)
        end
    end
     
     
    -------------------------------------------------------------------------------------------------------------------
    -- User code that supplements self-commands.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Called by the 'update' self-command, for common needs.
    -- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	adjust_engaged_sets()
end

function job_buff_change(buff, gain)
    
    if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
    
    -- Warp ring rule, for any buff being lost
    if S{'Warp', 'Vocation', 'Capacity'}:contains(player.equipment.ring2) then
        if not buffactive['Dedication'] then
            disable('ring1')
        end
    else
        enable('ring1')
    end

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function adjust_engaged_sets()
	state.CombatWeapon = player.equipment.main
	adjust_melee_groups()
end

function adjust_melee_groups()
	classes.CustomMeleeGroups:clear()
	if state.Buff.Aftermath then
		classes.CustomMeleeGroups:append('AM')
	end
end
     
    function select_default_macro_book()
            -- Default macro set/book
                    set_macro_page(1, 2)
    end