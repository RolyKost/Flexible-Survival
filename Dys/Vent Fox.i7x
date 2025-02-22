Version 3 of Vent Fox by Dys begins here.
[VERSION 2:                                                          ]
[v2.0 Adds Dominant Vent scenes                                      ]
[v2.1 He's an actual NPC now. No need to the quotes in the desc      ]
[v3 Normal Rim and Extended Rim scenes added - Vinickus]

"Adds a random encounter in the mall, and an NPC that can be interacted with."

[ VentFoxRelationship                                                ]
[   0 = not met                                                      ]
[   1 = met and helped                                               ]
[   2 = met twice and helped                                         ]
[   3 = vent location known                                          ]
[ 100 = didn't help                                                  ]
[ 101 = let Vent get raped by Logan                                  ]

[ VentFluidAmount - The amount of bodily fluids Vent produces        ]
[  0 = average                                                       ]
[  1 = more than average                                             ]
[  2 = way more than average                                         ]
[  3 = extreme                                                       ]

[ VentFoxContentLevel - level of unlocked content after helping him  ]
[  0 = never interacted                                              ]
[  1 = one interaction. Unlocks scenes where the fox dominates       ]
[  2 = two interactions. Unlocks kinkier scenes with the fox         ]
[  3 = three+ interactions. Unlocks extreme content with fox         ]

[ VentOviAmount - amount of oviposition to occur in supported scenes ]
[  0 = none                                                          ]
[  1 = only ovi on request                                           ]
[  2 = ovi during supported scenes                                   ]
[  3 = excessive ovi                                                 ]

[ VentWSAmount - amount of watersports to occur in supported scenes  ]
[  0 = none                                                          ]
[  1 = no marking unless requested                                   ]
[  2 = marking at any time, even during sex / penetration            ]
[  3 = marking at any time, especially during penetration            ]

[ VentFoxLastFed tracks how many turns have passed since Vent        ]
[ was last fed                                                       ]

[ VentDomSize is the body size for Vent to take during dominant sex. ]
[   3 = Average Latex Fox-sized                                      ]
[   4 = Lion-sized                                                   ]
[   5 = Direwolf-sized                                               ]

[ VentSubSize is the body size for Vent to take during submissive sex]
[   1 = Tiny                                                         ]
[   2 = Small                                                        ]
[   3 = Average                                                      ]

a postimport rule: [bugfixing rules for players that import savegames]
	if VentFoxContentLevel is 3:
		connect Maintenance Garage;

Section 0 - Variables

VentFoxEncounterCount is a number that varies.
VentFoxRelationship is a number that varies.
VentFoxContentLevel is a number that varies.
VentFoxLastFed is a number that varies. VentFoxLastFed is usually 1000.
VentDomSize is a number that varies. VentDomSize is usually 3.
VentSubSize is a number that varies. VentSubSize is usually 2.
VentOviAmount is a number that varies. VentOviAmount is usually 0.
VentWSAmount is a number that varies. VentWSAmount is usually 0.
VentFluidAmount is a number that varies. VentFluidAmount is usually 0.


Section 1 - Event

instead of going east from Mall Atrium while (VentFoxEncounterCount < 2 and a random chance of 1 in 3 succeeds): [33% chance of the player finding the vent fox.]
	move player to Mall East Wing;
	if debugactive is 1:
		say "     DEBUG: Vent Fox: [VentFoxEncounterCount][line break]";
	if VentFoxEncounterCount is 0: [first encounter with the derpy fox]
		say "     As you make your way to the east wing, you hear a squeaking noise coming from one of the abandoned storefronts.";
		say "     [bold type]Do you want to investigate?[roman type][line break]";
		LineBreak;
		say "     ([link]Y[as]y[end link]) - Check out the source of the sounds.";
		say "     ([link]N[as]n[end link]) - Continue past without looking.";
		if Player consents:
			now VentFoxEncounterCount is 1;
			LineBreak;
			say "     Opting to investigate the strange noises, you step through the doorway of the store. Looking around, most of it looks like it's been looted already, with shelves and displays being left barren. Towards the back of the shop, you can make out a vent. Looking closer, you see a red and white latex paw poking through the grating! The foreleg wiggles back and forth, its owner seeming to have gotten stuck. The squeaks you were hearing are louder now, and there's a definite distressed sound to them that makes you feel almost bad for the stuck feral. Looking at the ground directly in front of the vent, you see what looks like a bike tire inner tube. It's just a few feet away from the fox's paw, and it's clear he was attempting to get a snack for himself when he got stuck.";
			say "     [bold type]Do you help the stuck feral out?[roman type][line break]";
			LineBreak;
			say "     ([link]Y[as]y[end link]) - Yes.";
			say "     ([link]N[as]n[end link]) - No.";
			if Player consents:
				now VentFoxRelationship is 1;
				LineBreak;
				say "     Sighing, you step towards the vent before unfastening the latch that keeps it held in place. You pull the cover off, dragging the stuck fox out of the vent with it. He lets out a rather startled yelp and begins yanking harder on his arm. You mumble something under your breath, wishing it would stop squirming so you could help it, and almost as if it can understand you, it calms down. With it relaxed, you manage to slide the vent cover off of his paw. As soon as he's free, the rubber vulpine squeaks happily and darts back into the vent, disappearing from sight.";
				say "     With that problem solved, you place the grate back over the duct and fasten it in place before making your way out of the store and into the East Wing, wondering if you'll ever see [']Vent['] again.";
			else:
				now VentFoxRelationship is 100;
				now VentFoxEncounterCount is 3;
				LineBreak;
				say "     Deciding that it is not your responsibility to free the fox from the predicament he got himself into, you leave, continuing on to the East Wing. As you exit the store, you can hear a pitiful whine as the little creatures senses you deserting him.";
		else:
			LineBreak;
			say "     Deciding it's probably best to just move along, you continue making your way to the East Wing.";
	else if VentFoxEncounterCount is 1: [second time]
		say "     As you head to the East Wing, you hear squeaking coming from the same shop you'd found [']Vent['] in. Sighing, you decide to make your way to the store to help the silly latex vulpine. Stepping inside, you don't even bother looking around before you go to the vent. You unfasten the cover again, pulling it, and the fox towards you. This time, he doesn't seem startled or scared. As a matter of fact, he almost looks relieved. You gently free him from the grate, but this time, he doesn't dash back into the ductwork immediately. Instead, the little creature leans down to pick up the bike wheel tubing that is still laying there with his teeth, dragging it along. He turns to look at you before running back into the vents.";
		say "     Not bothering to put the cover back in place, you continue heading to the East Wing, a small smile on your [FaceSpeciesName of Player in lower case] face. [bold type]Perhaps you could search around the mall to find how the fox got inside in the first place...[roman type][line break]";
		now VentFoxEncounterCount is 2; [did the event twice]
		now VentFoxRelationship is 2;

Section 2 - Location

ventcover is an object. It is in Smith Haven Mall Lot West. It is fixed in place. Understand "cover" as ventcover.
Description of ventcover is "[VentCoverDescription]".

KnockOnVent is an action applying to nothing.
Understand "knock on it" as KnockOnVent.
Understand "knock vent" as KnockOnVent.
Understand "knock cover" as KnockOnVent.
Understand "knock on vent" as KnockOnVent.
Understand "knock on the vent" as KnockOnVent.
Understand "knock on cover" as KnockOnVent.
Understand "knock on the cover" as KnockOnVent.
Understand "knock on vent cover" as KnockOnVent.
Understand "knock on the vent cover" as KnockOnVent.

Check KnockOnVent:
	if ventcover is not visible, say "     What?" instead;

Carry out KnockOnVent:
	say "[KnockedOnVent]";

To say VentCoverDescription:[Description of the vent for various states of relationship.]
	if VentFoxRelationship < 3 or VentFoxRelationship is 100:[not known / disliked by Vent.]
		say "     You can see a large, grated vent on the wall of the building. It's close enough to the ground that a creature could conceivably climb inside. One of the metal slats covering the opening is bent open, providing a narrow but workable hole for that to have already happened too. Maybe you could try [link]knocking on it[as]knock on it[end link] to draw something out?";
	else if VentFoxRelationship is 101: [let Logan rape him.]
		say "     You can see a large, grated vent cover that once used to be inhabited by your companion. You could try knocking on it, but your fairly certain that Vent is no longer around.";
	else if VentFoxContentLevel is 3:
		say "     You can see a large, grated vent on the wall of the building. You know it used to be Vent's hideaway, but now that the fox has gotten too big for it, he's moved to the garage you found once while searching for food with him.";
	else:
		say "     You can see a large, grated vent on the wall of the building. You know it as Vent's hideaway. You can [link]knock on it[as]knock vent[end link] to get his attention.";

To say KnockedOnVent:[Various reactions to knocking on the vent.]
	if VentFoxRelationship is 0:[not met]
		say "     You tentatively knock on the vent cover, seeing if you can draw the attention of... well, you don't really know what. A few seconds of silence pass before you decide to go do something else.";
	else if VentFoxRelationship is 1:[met & helped]
		say "     You knock lightly on the vent cover, trying to draw the attention of whatever may be inside it. A few seconds of silence pass, and just as you're about to move on, you hear a soft shuffling, moving away from you through the vents. It's pretty obvious that [italic type]something[roman type] is in there.";
	else if VentFoxRelationship is 100:[met, didn't help]
		say "     You decided to knock on the vent grating, trying to draw the attention of whatever creatures may be residing inside it. However, you're almost instantly met with a soft growl. Frowning, you continue on your way.";
	else if VentFoxRelationship is 101:
		say "     You rap your knuckles against the vent cover lightly, hoping for some sort of response. Nothing makes a noise in response, and you're left to wonder if things could've gone differently.";
	else if VentFoxRelationship is 2:[met, helped twice.]
		say "     You knock lightly on the vent cover, trying to draw the attention of whatever may be inside it. A few seconds of silence pass, and just as you're about to move on, you begin to hear a soft shuffling, drawing closer to you with each passing moment. A couple seconds later, the shuffling stops and a black, red, and white rubber vulpine sticks his head through the hole in the grating with a determined squeak. Seeing that you're his visitor, the Vent Fox yips happily before moving back into the vent. Maybe next time you visit you could [']play['] with him...";
		now VentFoxRelationship is 3; [vent known]
	else if VentFoxRelationship is 3:[vent known]
		if VentFoxContentLevel is 3:
			say "     You bring you fist up to knock on the cover, but you pause at the last second, remembering that Vent has since moved from this location. [bold type]Vent can be found in the Maintenance Garage north of here..[roman type].";
		else:
			say "     You knock lightly on the vent cover, trying to draw the attention of whatever may be inside it. A few seconds of silence pass, and just as you're about to move on, you begin to hear a soft shuffling, drawing closer to you with each passing moment. A couple seconds later, the shuffling stops and a black, red, and white rubber vulpine sticks his head through the hole in the grating with a determined squeak. After seeing who his visitor is, the latex vulpine yips happily in greeting before his body flows into a liquid blob, dripping out of the vent and onto the ground. Why he couldn't have done that when he was stuck inside, you're really not sure. Once all of his mass is outside, he quickly reforms into his normal shape, staring at you patiently, as if asking you what you wanted to do.";
			say "[VentFoxMenu]";
	else:
		say "     DEBUG: You shouldn't be able to see this! If you are, contact @Dys on the FS Discord, and give him the error code: VentFox:[VentFoxEncounterCount],[VentFoxRelationship]";

Section 3 - NPC and Location

Table of GameCharacterIDs (continued)
object	name
Vent	"Vent"

Vent is a man. The HP of Vent is usually 0.
ScaleValue of Vent is 4. [horse sized]
Body Weight of Vent is 4. [scale of 1-9 for body weight, grouped into low weight (1-3), mid weight (4-6) and high weight (7-9)]
Body Definition of Vent is 3. [scale of 1-9 for body definition, grouped into low muscle (1-3), mid muscle (4-6), high muscle (7-9)]
[Body Adjective is generated out of the body weight and body definition and can be used in scenes - one word descriptive adjective depending on weight and definition groups: low weight group: skinny/slender/lithe; mid weight group: average/fit/muscled; high weight group: pudgy/husky/jacked]
Androginity of Vent is 2. [Gender Adjective is generated out of androginity 1-9: hypermasculine/masculine/somewhat effeminate/effeminate/androgynous/feminine butch/tomboyish/feminine/hyperfeminine]
Mouth Length of Vent is 7. [inches deep for face fucking; maximum possible will be double this number (when deep throating)]
Mouth Circumference of Vent is 3. [mouth circumference 1-5, "tiny, small, normal, wide, gaping"]
Tongue Length of Vent is 7. [length in inches]
Breast Size of Vent is 0. [cup size as number, counting Flat Pecs = 0, A = 1, B = 2, ...]
Nipple Count of Vent is 0. [count of nipples]
Asshole Depth of Vent is 8. [inches deep for anal fucking]
Asshole Tightness of Vent is 2. [asshole tightness 1-5, "extremely tight, tight, receptive, open, gaping"]
Cock Count of Vent is 1. [number of cocks]
Cock Girth of Vent is 3. [thickness 1-5, thin/slender/average/thick/monstrous]
Cock Length of Vent is 7. [Length in Inches]
Ball Count of Vent is 2. [allowed numbers: 1 (uniball), 2 or 4]
Ball Size of Vent is 4. [size of balls 1-7: "acorn-sized", "dove egg-sized", "chicken egg-sized" "goose-egg sized", "ostrich-egg sized", "basketball-sized", "beachball-sized"]
Cunt Count of Vent is 0. [number of cunts]
Cunt Depth of Vent is 0. [penetratable length in inches; some minor stretching allowed, or more with Twisted Capacity]
Cunt Tightness of Vent is 0. [size 1-5, generates adjectives of extremely tight/tight/receptive/open/gaping]
Clit Size of Vent is 0. [size 1-5, very small/small/average/large/very large]
[Basic Interaction states as of game start]
PlayerMet of Vent is false.
PlayerRomanced of Vent is false.
PlayerFriended of Vent is false.
PlayerControlled of Vent is false.
PlayerFucked of Vent is false.
OralVirgin of Vent is true.
Virgin of Vent is true.
AnalVirgin of Vent is true.
PenileVirgin of Vent is true.
SexuallyExperienced of Vent is false.
TwistedCapacity of Vent is false. [Twisted Characters can take any penetration, no matter the size]
Sterile of Vent is true. [steriles can't knock people up]
MainInfection of Vent is "Latex Fox".
Description of Vent is "[VentDescription]".
Conversation of Vent is { "blah blah blarg" }.
The scent of Vent is "[VentScent]".
Vent is in Maintenance Garage.
The linkaction of Vent is "Possible Actions: [link]talk[as]talk vent[end link], [link]smell[as]smell vent[end link], [link]fuck[as]fuck vent[end link], [link]request[as]request vent[end link][line break]".

RequestVent is an action applying to nothing.
Understand "request vent" as RequestVent.

Check RequestVent:
	if Vent is not visible, say "     Who?" instead;

Carry out RequestVent:
	say "[VentFoxPrefsMenu]";

Instead of fucking the Vent:
	say "[VentFoxSexMenu]";

to say VentDescription:
	say "     Vent is now only a bit smaller than a horse normally, however, he can change his size at will. His rubber body is a mixture of red, white, and black latex. The red covers his back and legs, as well as most of his face and tail. The white color is found on the tip of his tail, along his underbelly and chin, and inside his ears. The black covers his four paws like gloves, and the tips of his ears. Looking at his [']equipment['], you can see he has a plump, white sheath, and a set of baseball-sized balls.";

to say VentScent:
	say "     Vent has a sort of chemical aroma to him that reminds you of freshly cured latex. You can pick up faint hints of a foxy musk as well.";

instead of conversing the Vent:
	say "     You speak to Vent casually, and he seems to listen attentively, even giving a nod here and there.";

Table of GameRoomIDs (continued)
Object	Name
Maintenance Garage	"Maintenance Garage"

Maintenance Garage is a room.
Description of Maintenance Garage is "[MaintenanceGarageDescription]".

to say MaintenanceGarageDescription:
	say "     Vent's new home is sparsely decorated. A few workbenches line the rear wall, and a hydraulic lift is off to one side of the room. Aside from that, there's not much to see. Off to one corner, you can see Vent. He gives you a toothy grin as he sees you, eager to spend time with you.";

to connect Maintenance Garage:
	change the North exit of Smith Haven Mall Lot West to Maintenance Garage;
	change the South exit of Maintenance Garage to Smith Haven Mall Lot West;

Section 4 - Menus

Chapter 1 - Main Menus

to say VentFoxMenu:[Menu for interacting with Vent.]
	say "     Well, what do you do with the fox?";
	setmonster "Latex Fox";
	choose row MonsterID from the Table of Random Critters;
	now sextablerun is 0;
	blank out the whole of table of fucking options;
	[]
	choose a blank row from table of fucking options;
	now title entry is "Help the rubber fox find some food";
	now sortorder entry is 1;
	now description entry is "Assist the Vent Fox in finding something to eat";
	[]
	choose a blank row from table of fucking options;
	now title entry is "Have sex with him";
	now sortorder entry is 2;
	now description entry is "Have some fun with your foxy compatriot";
	[]
	if VentFoxContentLevel is 3:
		choose a blank row from table of fucking options;
		now title entry is "Request some things of the fox";
		now sortorder entry is 3;
		now description entry is "Change the way you interact with Vent";
	[]
	sort the table of fucking options in sortorder order;
	repeat with y running from 1 to number of filled rows from table of fucking options:
		choose row y from the table of fucking options;
		say "[link][y] - [title entry][as][y][end link][line break]";
	say "[line break][link]0 - Nevermind[as]0[end link][line break]";
	while sextablerun is 0:
		say "Pick the corresponding number> [run paragraph on]";
		get a number;
		if calcnumber > 0 and calcnumber <= the number of filled rows from table of fucking options:
			now current menu selection is calcnumber;
			choose row calcnumber from table of fucking options;
			say "[title entry]: [description entry]?";
			if Player consents:
				let nam be title entry;
				now sextablerun is 1;
				if nam is:
					-- "Help the rubber fox find some food":
						say "[VentFoxScavengeFood]";
					-- "Have sex with him":
						say "[VentFoxSexMenu]";
					-- "Request some things of the fox":
						say "[VentFoxPrefsMenu]";
				wait for any key;
		else if calcnumber is 0:
			say "     Change your mind and do something else?";
			if Player consents:
				now sextablerun is 1;
				say "     Opting to leave for now, you wave goodbye to the fox. He lets out a disappointed whine as you go.";
				wait for any key;
			else:
				say "Pick an option.";
		else:
			say "Invalid selection made. Please pick an option from 1 to [the number of filled rows in the table of fucking options].";
	clear the screen and hyperlink list;

to say VentFoxSexMenu:[Pretty self explanatory.]
	if Player is male:
		say "     What kind of sex do you want to have?";
		choose row MonsterID from Table of Random Critters;
		now sextablerun is 0;
		blank out the whole of table of fucking options;
		[]
		if anallevel > 1:
			choose a blank row from table of fucking options;
			now title entry is "Fuck Vent's ass";
			now sortorder entry is 1;
			now description entry is "Use the fox's hole for your own pleasure";
		[]
		if anallevel > 1 and VentFoxContentLevel > 0 and scalevalue of Player <= 3:
			choose a blank row from table of fucking options;
			now title entry is "Get fucked by Vent";
			now sortorder entry is 2;
			now description entry is "Have the fox take your hole";
		[]
		if anallevel > 2 and VentFoxContentLevel > 0:
			choose a blank row from table of fucking options;
			now title entry is "Get rimmed by Vent";
			now sortorder entry is 5;
			now description entry is "Have the fox shove that latex tongue inside you";
		[]
		if anallevel > 2 and VentFoxContentLevel > 1:
			choose a blank row from table of fucking options;
			now title entry is "Get Vent to rim you with his tongue extended";
			now sortorder entry is 6;
			now description entry is "Have Vent use his more dexterous organ to thoroughly rim you";
		[][
		if anallevel > 2 and VentFoxContentLevel > 2 and player is kinky:
			choose a blank row from table of fucking options;
			now title entry is "Get tongue-fucked by Vent";
			now sortorder entry is 7;
			now description entry is "Get Vent to use his shapeshifting abilities to fuck you with a cock-tongue";
		[]
		if VentFoxContentLevel > 0:
			choose a blank row from table of fucking options;
			now title entry is "Suck Vent's cock";
			now sortorder entry is 8;
			now description entry is "Take that rubber shaft into your mouth";
		[]
		choose a blank row from table of fucking options;
		now title entry is "Get Vent to suck your dick";
		now sortorder entry is 9;
		now description entry is "Have the rubber vulpine give you a blowjob.";
		[]]
		sort the table of fucking options in sortorder order;
		repeat with y running from 1 to number of filled rows from table of fucking options:
			choose row y from the table of fucking options;
			say "[link][y] - [title entry][as][y][end link][line break]";
		say "[line break][link]0 - Nevermind[as]0[end link][line break]";
		while sextablerun is 0:
			say "Pick the corresponding number> [run paragraph on]";
			get a number;
			if calcnumber > 0 and calcnumber <= the number of filled rows from table of fucking options:
				now current menu selection is calcnumber;
				choose row calcnumber from table of fucking options;
				say "[title entry]: [description entry]?";
				if Player consents:
					let nam be title entry;
					now sextablerun is 1;
					if nam is:
						-- "Fuck Vent's ass":
							say "[FuckVentFoxAss]";
						-- "Get fucked by Vent":
							say "[VentFoxFucksPlayer]";
						-- "Get rimmed by Vent":
							say "[VentFoxRimsPlayerNormal]";
						-- "Get Vent to rim you with his tongue extended":
							say "[VentFoxRimsPlayerExtend]";
						-- "Get tongue-fucked by Vent":
							say "[VentFoxTongueFucksPlayer]";
						-- "Suck Vent's cock":
							say "[SuckVentFoxCock]";
						-- "Get Vent to suck your dick":
							say "[VentFoxSuckCock]";
					wait for any key;
			else if calcnumber is 0:
				say "     Change your mind and do something else?";
				if Player consents:
					now sextablerun is 1;
					say "     Opting to leave for now, you wave goodbye to the fox. He lets out a disappointed whine as you leave.";
					wait for any key;
				else:
					say "Pick an option.";
			else:
				say "Invalid selection made. Please pick an option from 1 to [the number of filled rows in the table of fucking options].";
		clear the screen and hyperlink list;
	else:
		say "     As you make your offer to the latex vulpine, he shakes his head, indicating that he isn't interested in having sex with you. It seems you lack the equipment he prefers...";

to say VentFoxPrefsMenu:[Menu for setting preferences.]
	say "     Vent has acquired enough mass to do lots of things to his body. The fox listens attentively as you speak to him. What should you ask him to change?";
	clear the screen and hyperlink list;
	while calcnumber is not -100:
		LineBreak;
		say "     [bold type]Size[roman type]";
		LineBreak;
		say "     [link](1)[as]1[end link] - Size during submissive sex.";
		say "     (2) - [italic type]Not yet available[roman type].";
		LineBreak;
		say "     [bold type]Content[roman type]";
		LineBreak;
		say "     (3) - [italic type]Not yet available[roman type].";
		say "     [link](4)[as]4[end link] - Watersports level.";
		say "     (5) - [italic type]Not yet available[roman type].";
		LineBreak;
		say "     [link](0)[as]0[end link] - Abort.";
		now calcnumber is -1;
		while calcnumber < 0 or calcnumber > 5:
			say "Choice? (0-5)>[run paragraph on]";
			get a number;
			if calcnumber >= 0 and calcnumber <= 5:
				break;
			else:
				say "Invalid choice.";
		if calcnumber is 1:
			say "[SubSexSizeMenu]";
		else if calcnumber is 2:
			say "[VentUnavailable]";
		else if calcnumber is 3:
			say "[VentUnavailable]";
		else if calcnumber is 4:
			say "[WSLevelMenu]";
		else if calcnumber is 5:
			say "[VentUnavailable]";
		else if calcNumber is 0:
			say "     Changing your mind, you tell Vent things are fine how they are now.";
			break;

to say VentUnavailable:
	clear the screen and hyperlink list;
	say "     [bold type]Vent shakes his head at your request. It seems he can't change this yet...[roman type][line break]";

Chapter 2 - Sub Menus

to say DomSexSizeMenu:[Menu for setting Vent's size during dominant sex.]
	clear the screen and hyperlink list;
	say "     You tell him that you want him to change his size while he dominates you. He nods, and waits for you to tell him what size he should be.";
	say "     [link](1)[as]1[end link] - Average Latex Fox size.";
	say "     [link](2)[as]2[end link] - Lion-sized Latex Fox.";
	say "     [link](3)[as]3[end link] - Direwolf-sized Latex Fox.";
	now calcnumber is 0;
	while calcnumber < 1 or calcnumber > 3:
		say "Choice? (1-3)>[run paragraph on]";
		get a number;
		if calcnumber >= 1 and calcnumber <= 3:
			break;
		else:
			say "Invalid choice.";
	if calcnumber is 1:
		say "     Vent nods at your request. He'll now be average in size when he dominates you.";
		now VentDomSize is 3;
	else if calcnumber is 2:
		say "     Vent nods at your request. He'll now be lion-sized when he dominates you.";
		now VentDomSize is 4;
	else:
		say "     Vent nods at your request. He'll now be larger than a horse when he dominates you.";
		now VentDomSize is 5;

to say SubSexSizeMenu:[Menu for setting Vent's size during submissive sex.]
	clear the screen and hyperlink list;
	say "     You tell him that you want him to change his size while you dominate him. He nods, and waits for you to tell him what size he should be.";
	say "     (1) - Not yet available.";
	say "     [link](2)[as]2[end link] - Small Latex Fox.";
	say "     [link](3)[as]3[end link] - Average Latex Fox.";
	now calcnumber is 0;
	while calcnumber < 1 or calcnumber > 3:
		say "Choice? (1-3)>[run paragraph on]";
		get a number;
		if calcnumber >= 1 and calcnumber <= 3:
			break;
		else:
			say "Invalid choice.";
	if calcnumber is 1:
		say "     Vent shakes his head at your request. He seems to be against this idea.";
		now VentSubSize is 2;
	else if calcnumber is 1:
		say "     Vent nods at your request. He'll now be small in size when he is dominated by you.";
		now VentSubSize is 2;

to say FluidLevelMenu:[Menu for setting Vent's fluid production levels.]
	clear the screen and hyperlink list;
	say "     You tell the rubber vulpine you want him to change the amount of fluids he produces. He nods at you and waits for you to tell him how much he should be making.";
	say "     [link](0)[as]0[end link] - Average amounts.";
	say "     [link](1)[as]1[end link] - Above average amounts.";
	say "     [link](2)[as]2[end link] - Excessive amounts.";
	say "     [link](3)[as]3[end link] - Extreme amounts.";
	now calcnumber is -1;
	while calcnumber < 0 or calcnumber > 3:
		say "Choice? (0-3)>[run paragraph on]";
		get a number;
		if calcnumber >= 0 and calcnumber <= 3:
			break;
		else:
			say "Invalid choice.";
	if calcnumber is 0:
		say "     Nodding, Vent adjusts his body to produce normal amounts of everything from semen to saliva.";
		now VentFluidAmount is 0;
	else if calcnumber is 1:
		say "     Vent gives you an affirmative yip as he adjusts his body to produce more fluids than normal.";
		now VentFluidAmount is 1;
	else if calcnumber is 2:
		say "     Vent nods at your request. He'll now make rather excessive amounts of bodily fluids.";
		now VentFluidAmount is 2;
	else:
		say "     Vent nods at you, changing himself so he produces insane amounts of everything from cum, to saliva.";
		now VentFluidAmount is 3;

to say WSLevelMenu:[Menu for setting WS amount of Vent.]
	clear the screen and hyperlink list;
	if WSLevel is 3:
		say "     You tell the rubber vulpine you want him to change how much and how often he marks you. He nods at you and waits for you to elaborate.";
		say "     [link](0)[as]0[end link] - No marking.";
		say "     [link](1)[as]1[end link] - No marking unless requested.";
		say "     [link](2)[as]2[end link] - Marking at any time.";
		say "     [link](3)[as]3[end link] - Marking at any time, especially during penetration.";
		now calcnumber is -1;
		while calcnumber < 0 or calcnumber > 3:
			say "Choice? (0-3)>[run paragraph on]";
			get a number;
			if calcnumber >= 0 and calcnumber <= 3:
				break;
			else:
				say "Invalid choice.";
		if calcnumber is 0:
			say "     Nodding, Vent agrees to no longer mark you.";
			now VentWSAmount is 0;
		else if calcnumber is 1:
			say "     Vent gives you an affirmative yip to show he'll only mark you if you specifically request it.";
			now VentWSAmount is 1;
		else if calcnumber is 2:
			say "     Vent nods at your request. He'll now mark you at any time, sometimes during sex. [bold type]He may even mark you while penetrating you...[roman type][line break]";
			now VentWSAmount is 2;
		else:
			say "     Vent nods at you. He'll now mark you at any time, [italic type]especially[roman type] during sex. He'll make sure that he produces excessive urine as well. [bold type]He'll mark you while penetrating you, as well...[roman type][line break]";
			now VentWSAmount is 3;
	else:
		say "     You ask Vent to change how he marks you, but even he seems to know you aren't a fan of watersports... [italic type]To gain access to this, you need to change your watersports level to Full.[roman type][line break]";

to say OviLevelMenu:[Menu for setting Oviposition amount of Vent.]
	clear the screen and hyperlink list;
	if Player is kinky:
		say "     With his excellent control over his own body, Vent is capable of putting sterile gooey eggs inside you. How do you want this to be done?";
		say "     [link](0)[as]0[end link] - No egging.";
		say "     [link](1)[as]1[end link] - No egging unless requested.";
		say "     [link](2)[as]2[end link] - Egging during supported scenes.";
		say "     [link](3)[as]3[end link] - Excessive egging during supported scenes.";
		now calcnumber is -1;
		while calcnumber < 0 or calcnumber > 3:
			say "Choice? (0-3)>[run paragraph on]";
			get a number;
			if calcnumber >= 0 and calcnumber <= 3:
				break;
			else:
				say "Invalid choice.";
		if calcnumber is 0:
			say "     Nodding, Vent agrees to no longer [']impregnate['] you.";
			now VentOviAmount is 0;
		else if calcnumber is 1:
			say "     Vent gives you an affirmative yip to show he'll only egg you if you specifically request it.";
			now VentOviAmount is 1;
		else if calcnumber is 2:
			say "     Vent nods at your request. He may now decide to perform oviposition during some scenes.";
			now VentOviAmount is 2;
		else:
			say "     Vent nods at you. He will now perform oviposition during some scenes. [bold type]He also produces an excessive amount of eggs now.[roman type][line break]";
			now VentOviAmount is 3;
	else:
		say "     Even as you make the suggestion to Vent, you realize that you're honestly not kinky enough for that. [italic type]You need the 'Kinky' fun feat for this option.[roman type][line break]";

Section 5 - Scenes

Chapter 1 - Scavving Scenes

to say VentFoxScavengeFood:[Player helps the fox find some rubber to eat.]
	if VentFoxLastFed - turns >= 8:
		if VentFoxContentLevel is 0:[first time scavving.]
			say "     You happily suggest to the fox that you two can go look for some food together, not really expecting any form of comprehension. To your surprise, however, the rubber vulpine swishes its tail happily and nods its head. His body then shrinks down to be roughly the size of a lap-dog, and he hops up onto your shoulder. You can't help but let a smile grace your [if FaceName of Player is BodyName of Player][bodytype of Player] [end if]face as you begin walking aimlessly. It's very apparent to you that this feral is at least a little intelligent.";
			say "     You make your way around the building with no real destination in mind when you spot a garage on the other side of the surrounding parking lot. It looks like it used to be used for maintenance vehicles, with jacks and tools scattered around on workbenches pushed up against the walls. As you're taking in the room, Vent yips, startling you slightly. You look at the small fox on your shoulder to see his gaze is firmly locked with a stack of tires in the corner of the room. It seems he wants to eat those. You decide that no real harm can come from it, and you take him over to the stack of rubber. He hops off your shoulder, squeaking quietly as he lands. Deciding that he can handle it from there, you continue looking around the room, trying to see if there's anything you could use in here...";
			WaitLineBreak;
			say "     You're startled out of your search by a sudden bark. Whirling around, you're greeted by a much larger Vent, who is sitting on his haunches where the tires used to be. He's about the size of a wolf now. The latex vulpine gives you a grin before he shrinks his body back down to the size he was upon arrival, before hopping back up onto your shoulder and nuzzling you. He seems to be rather thankful.";
			say "     [italic type]You've helped Vent assimilate some material. Not only is the fox able to grow larger, but he also seems to be more confident around you. You can now do more with him.[roman type][line break]";
			now VentFoxContentLevel is 1;
			now VentFoxLastFed is turns;
		else if VentFoxContentLevel is 1:
			say "     You suggest to your rubber friend that you could go find some food together. He yips to show his approval before he shrinks down once more. However, he isn't quite able to become as small as he was last time, so he elects to simply walk in your shadow as you cross the parking lot, heading to a shed you can see in the distance. Your vulpine companion trots behind you, squeaking quietly every so often. As you come closer to the freestanding structure, you notice that the door still has a padlock barring entry. That could be a bit of a problem.";
			say "     [bold type]Should you try to find another way in? Otherwise, you'll just try to pry the lock off the door.[roman type][line break]";
			LineBreak;
			say "     ([link]Y[as]y[end link]) - Find another entrance.";
			say "     ([link]N[as]n[end link]) - Break the lock off.";
			if Player consents:
				LineBreak;
				let bonus be ((perception of Player - 10) / 2);
				let diceroll be a random number between 1 and 20;
				say "You roll 1d20([diceroll])+[bonus] = [special-style-1][diceroll + bonus][roman type] vs [special-style-2]16[roman type] (Perception Check):[line break]";
				if diceroll + bonus >= 16:
					say "     You see a stray piece of sheet metal leaning up against the rear wall of the shack. Moving it to the side, you can make out a hole just big enough for you to get through. Stepping inside, you look around before your eyes land on a large container of liquid rubber and its catalyzer. That should be perfect for Vent!";
					WaitLineBreak;
					say "[VentShedEatScene]";
				else:
					say "     You look around the building but you're unable to find any obvious entrance. Shaking your head in disappointment, you head back to Vent's vent, the fox seeming rather sad all the while.";
			else:
				LineBreak;
				let bonus be ((strength of Player - 10) / 2);
				let diceroll be a random number between 1 and 20;
				say "You roll 1d20([diceroll])+[bonus] = [special-style-1][diceroll + bonus][roman type] vs [special-style-2]16[roman type] (Strength Check):[line break]";
				if diceroll + bonus >= 16:
					say "     Grasping the lock by its hasp with one hand, and the body with the other, you tug hard. With a fair amount of effort, you feel the locking mechanism shearing and breaking before it finally snaps apart. You drop the two halves to the ground before you push the door open and step through it. Looking around the small space, your eyes eventually land on a large container of liquid latex along with a container of catalyzer. That should be perfect for Vent!";
					WaitLineBreak;
					say "[VentShedEatScene]";
				else:
					say "     You try as hard as you can, pulling and tugging on the lock, but your unable to break it away from the door. Shaking your head in disappointment, you step away, heading back to Vent's hideaway vent. The rubber vulpine walks with you, looking slightly sad.";
		else if VentFoxContentLevel is 2:
			say "     Vent lets out a happy sound at your suggestion before bounding off ahead of you for once. It seems he's very eager to find something to eat today. Shaking your head in amusement, you follow a few feet behind him watching him prance through the parking lot. He dashes around the deserted cars, every so often disappearing from your eyesight. He hops around an SUV, once more disappearing from view before you hear him let out a yelp. You quickly run to him, skidding around the corner, your eyes falling on Logan, the wolverine guard you've seen around holding the fox up by his rubber tail.";
			say "     'What have we got here?' he asks rhetorically. 'Looks like a little chew toy found his way past our security...' The guard is facing away from you, and he doesn't seem to have noticed your presence yet. Perhaps you could take him by surprise and help your friend?";
			LineBreak;
			say "     [bold type]Do you help Vent?[roman type][line break]";
			LineBreak;
			say "     [link](1)[as]1[end link] - Yes, sneak attack Logan!";
			if LoganCommand is 2:
				say "     [link](2)[as]2[end link] - Yes, use the command on him!";
				if Player is male:
					say "     [link](3)[as]3[end link] - Yes, use the command and fuck Logan!";
			say "     [link](0)[as]0[end link] - Do nothing.";
			now calcnumber is -1;
			while calcnumber < 0 or calcnumber > 3:
				say "Choice? (0-[if LoganCommand is 2 and player is male]3[else if LoganCommand is 2]2[else]1[end if])>[run paragraph on]";
				get a number;
				if (calcnumber is 2 and LoganCommand is 2) or (calcnumber is 3 and LoganCommand is 2 and player is male):
					break;
				else if calcnumber is 1 or calcnumber is 0:
					break;
				else:
					say "Invalid choice.";
			if calcnumber is 1:
				say "[VentLoganStopByAttacking]";
			else if calcnumber is 2:
				say "[VentLoganStopByCommand]";
			else if calcnumber is 3:
				say "[VentLoganCommandSex]";
			else:
				say "[VentLoganDoNothing]";
		else:
			say "     You think about going to find more food for Vent, but he's honestly so big at this point that there's really no point.";
	else:
		say "     You make your suggestions to Vent, but he simply shakes his head, still too full from his last meal.";

to say VentShedEatScene:
	say "     The vulpine comes in after you, and he gives the air a few sniffs before he dashes over to the containers of latex. He lets out a happy yip and looks at your expectantly, an excited gleam in his eyes. You grin and step over towards him, leaning down and unfastening the lids of the containers before tossing them aside. Now that he can get to the material, he extends his tail, forking it into two separate tendrils. Each one dips into each respective container, and you watch as the fluids flow up his tail and into his body. As it gets absorbed into his system, he grows larger. Once he's completely drained the containers, he's near the size of a lion. He gives you grin as he shrinks his body back down again, before you both make your way back to the vent.";
	now VentFoxContentLevel is 2;
	now VentFoxLastFed is turns;

to say VentLoganDoNothing: [the player is a butt head.]
	say "     Not wanting to provoke the wolverine, you instead opt to slip around the corner of the SUV, pressing yourself up against it to make sure you're as hidden as possible. Peeking your head around the corner, you watch Logan unzip his pants with his free hand, before he gives the rubber vulpine a long lick across his tailhole. Vent lets out a shuddering whimper, clearly not wanting any part of this. The guard doesn't seem to notice or care, however, as he continues his assault until the fox's hole is dripping with his saliva.";
	say "     Bringing his now-erect cock to Vent's prone form, he shoves it all in with one harsh thrust. The fox lets out a pained yelp as he's stretched suddenly. Logan pays no heed to the vulpine's cries, however, as he just starts to thrust his length in and out of Vent, using him purely for his own pleasure. He continues to fuck Vent roughly, picking up the pace all the while. He lets out a pleasured grunt as he bottoms out one last time before he cums, his load spilling into Vent's insides, distinctly bloating him with the heady fluid.";
	WaitLineBreak;
	say "     With his orgasm winding down, Logan pulls his softening cock out of the fox, before kicking the fox harshly. 'Get out of here, ya piece of trash! And don't come back!' Vent quickly obliges, running off into the city, probably never to be seen again. Finished with his business, Logan begins to turn around to head back to his patrol. You quietly slip away as soon as you get the chance, a distinct feeling of remorse coming over you for not intervening.";
	NPCSexAftermath Vent receives "AssFuck" from Logan;
	now VentFoxRelationship is 101;

to say VentLoganStopByCommand: [the player helps!]
	say "     Without a moment of hesitation, you shout out the command to take control of the wolverine. As it registers, his body stiffens slightly, and he turns to face you, his eyes glazed over and unseeing. Vent swings back and forth, still firmly held by his tail, looking at you desperately. You command Logan to set your friend down gently, and he does so without hesitation, setting the rubber vulpine back onto the ground before he looks at you again, waiting for the next command. You simply opt to get him to leave the two of you alone, telling him to move along as if he saw nothing. He obeys, as expected.";
	say "[VentFoxLastScavScene]";

to say VentLoganStopByAttacking: [the player also helps!]
	say "     Seeing a solid metal hubcap lying on the ground to your right, you quietly grab it. As Logan sneers at your friend, you sneak up behind him, raising the hubcap above your head before you slam it down as hard as you can. It connects with a loud bang, and Logan lets out a pathetic whimper as he crumples to the ground, completely unconscious. Vent falls as well, no longer being held up by the wolverine's grasp, and he hits the ground with a small squeak before he rights himself and gazes at you with a look of admiration on his feral muzzle.";
	say "[VentFoxLastScavScene]";

to say VentLoganCommandSex:
	say "     'Come here, will you!' You shout out loud, the command instantly taking effect. Logan turns towards you, his eyes glazed over and his body in your control. Out in the open you then drop whatever clothes you're wearing on your lower half, revealing your slowly hardening cock. With a rough order, you tell the wolverine to get on his knees and start sucking. Thanks to the mental magic worked on the guy by Moreau, he obeys you and lowers himself so that his muzzle is face first to your dick. When he licks his tongue along your manhood you shiver and moan, humping it against the male's mouth. Seconds later Logan takes you into his mouth. By how well the corrupt guard appears to be doing, you wonder if he's sucked cock before.";
	say "     Sadly for the wolverine, you're rather impatient. You abruptly grab ahold of his head and slam him down on your dick, but you don't leave him there for long. Instead, you start thrusting in and out of his mouth, groaning at the warm velvety grip of his throat. Having almost forgot about Vent, you look behind Logan and see that the latex fox is staring at you two rather curiously, as if interested by the sex, proven by his hardening cock. Wanting to show off for your friend, you begin to rapidly fuck the wolverine's face, enjoying the sound of your balls slapping against his chin. That however isn't the only noise coming from the male. It appears that he's enjoying it rather thoroughly if the fact that his dick is hardening against his stomach.";
	WaitLineBreak;
	say "     Suddenly though, you feel Vent headbutting your leg. Realizing that the fox is horny, you grow a smirk on your face. You order Logan to stay put and get on all fours as you reposition yourself at his backside, hotdogging your dick between his cheeks. Taking this as a cue the latex fox jumps onto the wolverine, placing his two front paws on the man's back, presenting him with the feral's dick. As if it was synchronized the two of you thrust inward at the same time, with you penetrating the male's ass and Vent his mouth. In tandem the two of you fuck the wolverine's orifices, your balls slapping wetly against his ass and Vent's against his chin. If Logan's throat felt great, then his ass felt amazing, squeezing your length in a tight vice, making you moan loudly.";
	say "     You quickly lose yourself in the pleasure of thrusting in and out of the wolverine's hole, mentally thinking that he deserves it, thinking back to when you had first seen him. Those thoughts fuel your fucking, making you slam into his entrance a lot rougher. If the yelps from Vent and the growing feeling in your balls tell you anything, the both of you are getting closer to your peaks. Not long after that, you feel your balls tighten and you let out a roar as you thrust in one last time before releasing your load into his ass. Looking over his back you see that the latex fox is cumming as well, as he is currently locked with Logan's mouth, spilling his sperm down the male's throat. This appears to set him off, the wolverine spilling his own seed onto the floor.";
	WaitLineBreak;
	say "     The three of you ride out your bliss and wait for Vent's knot to shrink down. When it does you realize that if you leave Logan like this he'll slowly realize what's happening. So instead you order him to clean up his mess with his tongue while you clean his ass. The wolverine nods and puts his face to the ground and slurps up his own cum. You look for something to clean with before finding a towel that you use to wipe his butt. About a few minutes later you're finally done. You then order the male to forget what happened here and to go on his own way before uttering the end command phrase. When you do, the glazed eyes go away and he walks away from the two of you. Once gone you look to Vent and see him staring at you in both what appears to be admiration and lust.";
	NPCSexAftermath Logan receives "OralCock" from Player;
	NPCSexAftermath Logan receives "OralCock" from Vent;
	NPCSexAftermath Logan receives "AssFuck" from Player;
	say "[VentFoxLastScavScene]";

to say VentFoxLastScavScene:
	say "     Now that the guard has been dealt with, you and your friend continue your search for some easily accessible rubber. Looking around the lot, you eventually see a totaled truck. Upon closer examination, you notice there's a whole bed-full of tires in it! Vent seems to realize this too, as he hops up into the back of the truck, making quick work of the tires. Soon enough, he's devoured them all, and grown in size as well. Your foxy compatriot now stands taller than a horse when at full size. Of course, he doesn't stay that large for long, quickly shrinking back down to a much more manageable size, hopping out of the truck bed. With his hunger sated, the two of you make your way back to his hide out.";
	now VentFoxContentLevel is 3;
	now VentFoxLastFed is turns;
	connect Maintenance Garage;

Chapter 2 - Sex Scenes

to say FuckVentFoxAss:[Player fucks the fox's ass.]
	now scalevalue of Vent is VentSubSize;
	if VentSubSize is 3:
		if Player is knotted:
			say "     You make your suggestion to Vent, and he yips happily before turning around and raising his tail for you. You quickly strip, stroking your own cock[smn] to harden [itthemm], before you line up with Vent's tailhole. Sparing one last glance to make sure no-one is around, you slowly begin to push your [cock size desc of Player] penis into his tight hole. ";
			if Cock Length of Player < 10:
				say "After a bit of pushing, you manage to bottom out to your growing knot, the fox taking your length without any problem.";
			else if Cock Length of Player < 20:
				say "After a fair amount of pushing, you manage to bottom out to your growing knot. Vent's belly is stretching outward slightly, highlighting the size difference between the two of you.";
			else if Cock Length of Player < 30:
				say "As you push deeper into his hole, you begin to notice Vent's stomach bulging. You stop for a moment, but the fox simply looks back on you, begging you with his eyes to keep going. You concede, and push more of your length into the fox, stretching him rather significantly before you manage to press your growing knot against his hole.";
			else:
				say "As you push more of your length into the vulpine's hole, you notice his stomach bulging outwards. Concerned for his safety, you stop and look at him. He looks back at you, a hungry look in his eyes and whines, begging you to push the rest into him. Obliging, you begin moving again, and soon enough, your knot is brushing against his entrance, his stomach forming to the shape of your [Cock of Player] cock, showing just how elastic he actually is.";
		else:
			say "     You make your suggestion to Vent, and he yips happily before turning around and raising his tail for you. You quickly strip, stroking your own cock[smn] to harden [itthemm], before you line up with Vent's tailhole. Sparing one last glance to make sure no-one is around, you slowly begin to push your [cock size desc of Player] penis into his tight hole. ";
			if Cock Length of Player < 10:
				say "After a bit of pushing, you manage to bottom out, brushing your hips against him, the fox taking your length without any problem.";
			else if Cock Length of Player < 20:
				say "After a fair amount of pushing, you manage to bottom out to the base of your shaft. Vent's belly is stretching outward slightly, highlighting the size difference between the two of you.";
			else if Cock Length of Player < 30:
				say "As you push deeper into his hole, you begin to notice Vent's stomach bulging. You stop for a moment, but the fox simply looks back on you, begging you with his eyes to keep going. You concede, and push more of your length into the fox, stretching him rather significantly before you manage to press all of your shaft into him.";
			else:
				say "As you push more of your length into the vulpine's hole, you notice his stomach bulging outwards. Concerned for his safety, you stop and look at him. He looks back at you, a hungry look in his eyes and whines, begging you to push the rest into him. Obliging, you begin moving again, and soon enough, your hips are brushing against him, his stomach forming to the shape of your [Cock of Player] cock, showing just how elastic he actually is.";
		say "     With your shaft fully inside him[if Player is knotted], excluding the knot[end if], you begin to draw back, his latex hole squeezing and rippling around your shaft in the most amazing of ways. Eventually, only your tip remains inside him, and you pause for just a second before pressing back into him, faster this time. On your next withdrawal, Vent lets out a pleasured growl. He's clearly enjoying this, and you've barely started. You begin to build a rhythm, and you notice Vent's own throbbing cock, fully out of its sheath and dripping pre.";
		WaitLineBreak;
		say "     [bold type]Do you lend him a helping hand?[roman type][line break]";
		LineBreak;
		say "     [link]Y[as]y[end link] - Jack the fox off as you take him.";
		say "     [link]N[as]n[end link] - Leave his cock unattended.";
		if Player consents:
			say "     As you continue to thrust lightly into him, you reach around his body, cupping your hand just under the tip of his shaft. After a decent amount of his pre drips onto your hand, you grasp his tool and begin stroking it in sync with your own thrusts, the fluid acting as an effective lubricant. As your speed picks up, so do your strokes, bringing the fox closer and closer to the edge. Just before he reaches his peak, you slide your hand down to the knot and you squeeze it hard. Vent lets out an excited yip and his cock begins to throb as he releases his cum, his knot swelling [if scalevalue of Player < 3]large enough to eclipse your hand completely[else]until it fills the palm of your hand nicely[end if].";
		else:
			say "     You decide against helping the fox, but he actually doesn't seem bothered by that. As your thrusting picks up in speed, he begins to buck backwards into your [if Player is knotted]knot[else]hips[end if], his own cock slapping into his belly with each motion. His tunnel is rippling around your [cock size desc of Player] cock, rubbing and squeezing it, the smooth latex feeling better than any hole you've taken prior. You increase your pace even more, and Vent lets out an excited yip as he spills his seed onto the ground, a small pool of rubbery, white fluid forming beneath him.";
		WaitLineBreak;
		if Player is knotted:
			say "     As he climaxes, his walls pulse around your [cock size desc of Player] [Cock of Player] cock, nearly making you cum. You manage to hold back, however, and continue to rail into him over and over again with increasing force and ferocity, fully intent on burying your knot inside his tight, latex hole. You feel your ball of flesh beginning to expand, your climax close, and you rut into him with shorter, faster stroke. ";
			if Cock Length of Player < 10:
				say "With one final thrust, you push all the way in, your knot swelling and locking the two of you together as you cum.";
			else if Cock Length of Player < 20:
				say "You push hard against his entrance, your [cock size desc of Player] penis stretching him even further than before until your knot slides in with a wet squelch. The lump of flesh swells even larger, locking the two of you together as you release your cum inside him.";
			else:
				say "You batter his entrance with your [cock size desc of Player] knot, each thrust spreading his ring open just a little more until your knot slips in with a loud squelch. It quickly swells up, locking you together and making his hips stretch apart to accommodate the massive intrusion. With your knot firmly in his hole, you begin to climax.";
		else:
			say "     As he climaxes, his passage clenches and ripples around your shaft, sending intense waves of pleasure through you. The pulsing latex sheath around your cock almost make you reach orgasm, but you fight that urge, determined to last just a little longer. You pound into his tight hole with increasing fervor, your balls slapping against his with every thrust. Vent lets out a pleasured whine and continues to meet your thrusts, an action that brings you closer and closer to the edge. You thrust all the way in one last time before you orgasm, spilling your cum into his insides.";
		say "     Rope after rope of cum fills his bowels, and he climaxes again from the feeling of being filled. Eventually, your orgasm abates[if Player is knotted] and your knot shrinks[end if]. You pull out of your foxy friend, giving him a friendly pat before redressing and moving on.";
	else if VentSubSize is 2:
		if Player is knotted:
			say "     You make your suggestion to Vent, and he yips happily before turning around and raising his tail for you. You quickly strip, stroking your own cock[smn] to harden [itthemm], before you line up with Vent's tailhole. Sparing one last glance to make sure no-one is around, you slowly begin to push your [cock size desc of Player] penis into his tight hole. ";
			if Cock Length of Player < 10:
				say "After a bit of pushing, you manage to bottom out to your growing knot, the fox taking your length without any issue, his stomach bulging outward slightly.";
			else if Cock Length of Player < 20:
				say "After a fair amount of pushing, you manage to bottom out to your growing knot. Vent's belly is stretching outward distinctly, highlighting the size difference between the two of you.";
			else if Cock Length of Player < 30:
				say "As you push deeper into his hole, you begin to notice Vent's stomach bulging. You stop for a moment, but the fox simply looks back on you, begging you with his eyes to keep going. You concede, and push more of your length into the fox, stretching him rather significantly before you manage to press your growing knot against his hole.";
			else:
				say "As you push more of your length into the vulpine's hole, you notice his stomach bulging outwards. Concerned for his safety, you stop and look at him. He looks back at you, a hungry look in his eyes and whines, begging you to push the rest into him. Obliging, you begin moving again, and soon enough, your knot is brushing against his entrance, his stomach forming to the shape of your [Cock of Player] cock, showing just how elastic he actually is.";
		else:
			say "     You make your suggestion to Vent, and he yips happily before turning around and raising his tail for you. You quickly strip, stroking your own cock[smn] to harden [itthemm], before you line up with Vent's tailhole. Sparing one last glance to make sure no-one is around, you slowly begin to push your [cock size desc of Player] penis into his tight hole. ";
			if Cock Length of Player < 10:
				say "After a bit of pushing, you manage to bottom out, brushing your hips against him, the fox taking your length without any problem, his stomach stretching out slightly.";
			else if Cock Length of Player < 20:
				say "After a fair amount of pushing, you manage to bottom out to the base of your shaft. Vent's belly is stretching outward rather noticeably, highlighting the size difference between the two of you.";
			else if Cock Length of Player < 30:
				say "As you push deeper into his hole, you begin to notice Vent's stomach bulging rather significantly. You stop for a moment, but the fox simply looks back on you, begging you with his eyes to keep going. You concede, and push more of your length into the fox, stretching him rather significantly before you manage to press all of your shaft into him.";
			else:
				say "As you push more of your length into the vulpine's hole, you notice his stomach bulging outwards. Concerned for his safety, you stop and look at him. He looks back at you, a hungry look in his eyes and whines, begging you to push the rest into him. Obliging, you begin moving again, and soon enough, your hips are brushing against him, his stomach forming to the shape of your [Cock of Player] cock, showing just how elastic he actually is.";
		say "     With your shaft fully inside him[if Player is knotted], excluding the knot[end if], you begin to draw back, his latex hole squeezing and rippling around your shaft in the most amazing of ways. Eventually, only your tip remains inside him, and you pause for just a second before pressing back into him, faster this time. On your next withdrawal, Vent lets out a pleasured growl. He's clearly enjoying this, and you've barely started. You begin to build a rhythm, and you notice Vent's own throbbing cock, fully out of its sheath and dripping pre.";
		WaitLineBreak;
		say "     [bold type]Do you lend him a helping hand?[roman type][line break]";
		LineBreak;
		say "     [link]Y[as]y[end link] - Jack the fox off as you take him.";
		say "     [link]N[as]n[end link] - Leave his cock unattended.";
		if Player consents:
			say "     As you continue to thrust lightly into him, you reach around his body, cupping your hand just under the tip of his shaft. After a decent amount of his pre drips onto your hand, you grasp his tool and begin stroking it in sync with your own thrusts, the fluid acting as an effective lubricant. As your speed picks up, so do your strokes, bringing the fox closer and closer to the edge. Just before he reaches his peak, you slide your hand down to the knot and you squeeze it hard. Vent lets out an excited yip and his cock begins to throb as he releases his cum, his knot swelling [if scalevalue of Player < 3]large enough to eclipse your hand completely[else]until it fills the palm of your hand nicely[end if].";
		else:
			say "     You decide against helping the fox, but he actually doesn't seem bothered by that. As your thrusting picks up in speed, he begins to buck backwards into your [if Player is knotted]knot[else]hips[end if], his own cock slapping into his belly with each motion. His tunnel is rippling around your [cock size desc of Player] cock, rubbing and squeezing it, the smooth latex feeling better than any hole you've taken prior. You increase your pace even more, and Vent lets out an excited yip as he spills his seed onto the ground, a small pool of rubbery, white fluid forming beneath him.";
		WaitLineBreak;
		if Player is knotted:
			say "     As he climaxes, his walls pulse around your [cock size desc of Player] [Cock of Player] cock, nearly making you cum. You manage to hold back, however, and continue to rail into him over and over again with increasing force and ferocity, fully intent on burying your knot inside his tight, latex hole. You feel your ball of flesh beginning to expand, your climax close, and you rut into him with shorter, faster stroke. ";
			if Cock Length of Player < 10:
				say "With one final thrust, you push all the way in, your knot swelling and locking the two of you together as you cum.";
			else if Cock Length of Player < 20:
				say "You push hard against his entrance, your [cock size desc of Player] penis stretching him even further than before until your knot slides in with a wet squelch. The lump of flesh swells even larger, locking the two of you together as you release your cum inside him.";
			else:
				say "You batter his entrance with your [cock size desc of Player] knot, each thrust spreading his ring open just a little more until your knot slips in with a loud squelch. It quickly swells up, locking you together and making his hips stretch apart to accommodate the massive intrusion. With your knot firmly in his hole, you begin to climax.";
		else:
			say "     As he climaxes, his passage clenches and ripples around your shaft, sending intense waves of pleasure through you. The pulsing latex sheath around your cock almost make you reach orgasm, but you fight that urge, determined to last just a little longer. You pound into his tight hole with increasing fervor, your balls slapping against his with every thrust. Vent lets out a pleasured whine and continues to meet your thrusts, an action that brings you closer and closer to the edge. You thrust all the way in one last time before you orgasm, spilling your cum into his insides.";
		say "     Rope after rope of cum fills his bowels, and he climaxes again from the feeling of being filled. Eventually, your orgasm abates[if Player is knotted] and your knot shrinks[end if]. You pull out of your foxy friend, giving him a friendly pat before redressing and moving on.";
	NPCSexAftermath Vent receives "AssFuck" from Player;

to say VentFoxRimsPlayerNormal: [Player gets rimmed by the fox]
	say "     Deciding on getting the squeaky fox to eat you out, you [if player is naked]bend over and slap your ass[else]quickly strip off whatever may be blocking your fun with the fox, then bend over and slap your ass[end if]. A high pitched squeak rings throughout the garage, the fox clearly excited by what you're offering. There's little wait, for either of you, as you feel his nose bump against your rear cheeks. You ask him to just eat you out for now, and he gives a yip before his tongue laps along one of your glutes. The fox seems hellbent on teasing you, as his tongue ever so slightly moves to the side on each swipe, lapping closer and closer to your hole. However, there seems to be little in his mind other than driving you to push him there yourself: to cram his muzzle between your cheeks.";
	say "     And that is exactly what you do, reaching behind and grabbing his rubbery head as you spread your ass. You then easily shift his lapping muzzle right between your glutes, and right over your hole. At that point, he doesn't even hesitate, and laps in earnest at your winking star. There's little there for him to be perturbed by either, as it no doubt smells of pure musk, and nothing else. That gets the fox to go even heavier in his efforts to please you. You're a dear friend, so he's no doubt further encouraged to make you happy. This drives him to focus his lapping towards the center of your hole, the wet appendage slipping ever so slightly inside you. This forces a quite carnal moan from your throat, sounding almost like a bellow. As the tongue drills into you, twisting back and forth as it wiggles about, you feel yourself approaching the edge.";
	WaitLineBreak;
	say "     The rubbery male appears to sense this, as Vent pulls back and slows his rimming. His tongue then just lightly swipes along your saliva drenched hole. Gone is the eager tonguing of your ass, and now he seems deadset on teasing you. The feeling of being on edge is gone, replaced by a low, pleasant buzz throughout your body. Your position of leaning over, hands on your knees, makes it a bit hard to please yourself, but moving is clearly not an option either, because then you'd lose the amazing feeling of that rubbery tongue on your ass. You are stuck in the middle of quite the conundrum, but you know that tongue will be perfect if you just wait. So that's exactly what you do, and simply let the latex fox drench your hole in rubbery spit.";
	say "     That dexterous tongue soon returns to probing your hole, flicking and slurping at your anus as the male yips out. There's nothing stopping you from quickly reaching your edge once more, but unlike before, there's no sign of the fox slowing down. In fact, the fox seems to be speeding up, drilling his tongue into your hole, stretching you around that oh-so-talented appendage. You aren't stretched by much, but it's enough to let that muscle slip in and jab your prostate. Your mind goes blank, little white dots float in your view, and your cock lurches as your balls pull up. The splatter of your cum on the floor is more than audible, but you don't care. The only thing you really care for, take notice of, is that slippery appendage jabbing your prostate. It lengthens your orgasm and leaves you begging for more, and less. By the time that tongue is out of your ass, you're face down in your own pool of cum, Vent snuggling up next to you as you get some rest.";
	WaitLineBreak;
	say "     You wake up to Vent watching you, his eyes soft as he observes you in a very human manner. When you get up to leave, however, he goes back to his usual spot.";
	NPCSexAftermath Player receives "Other" from Vent;

to say VentFoxRimsPlayerExtend: [Player gets rimmed by the fox w/ extended tongue]
	say "     Deciding on getting the squeaky fox to eat you out with his long, almost serpantine tongue, you [if player is naked]bend over and slap your ass[else]quickly strip off whatever may be blocking the fun, then bend over and slap your ass[end if]. A high pitched squeak rings throughout the garage, the fox clearly excited by what you're offering. There's little there for him to be perturbed by either, as it no doubt smells of pure musk, and nothing else. You can't lie to yourself in that moment, you've wanted this ever since you saw his new tongue, and you just know it's going to be ama– your mind flatlines as that tongue immediately swipes from your genitals to lower back. Its progress was slowed by your anus, but that did nothing to stop it.";
	say "     Your ass is already dripping with rubbery saliva, but that isn't the end of it, and neither of you would want it to be. The next thing you feel is that long tongue dripping saliva right on your star. Then, before you know it, that slippery length rams at your hole, slipping back and forth as it tries to spread you around it. You lose even more control after that, moaning encoherently as that muscle really works your hole. Each new effort by Vent allows that tongue to push just a bit further into your hole. He's barely a hair in, but after several more efforts, he's twice that, and then three times, four, five, and eventually his tongue breaks through your hole and rams your prostate.";
	WaitLineBreak;
	say "     Your cock slaps against your stomach as Vent pounds his tongue into you. There's nothing to hold in your guttural moans, and so you sound out like a beast in heat. At this point, in this city, that's not unusual, but what gets you is the feeling of pure pleasure radiating just from your ass. Even the sparks of ecstasy through your cock are merely from that eager tongue inside you. There's nothing to do but beg that deific fox to keep going. Your words are barely intelligable, dribbling from your mouth as you drool all over yourself in a dull-minded state. The fox has no intent to stop, or even slow, and that is made ever more clear as more of his tongue coils up inside you, putting more and more pressure on your g-spot.";
	say "     There's nothing else needed for you to finally crescendo, firing your seed out onto the floor, your chest, and even stomach. The force of your ejaculation easily bounces your cock upwards, so with each shot, it smears more seed across your form. Eventually, your dick is angled just right to blast your face, forcing a sputtering noise from you as you finally fall to all fours, and then onto your chest. The cum pooled across the floor now joins that which was splattered all over the rest of your upper body, leaving your entire front caked in sperm. Vent wiggles his tongue some more, but even he seems drained, so he soon pulls from your ass with a wet squelch, moving to curl up next to you as you drift off.";
	WaitLineBreak;
	say "     You wake up to Vent watching you, his eyes soft as he observes you in a very human manner. When you get up to leave, however, he goes back to his usual spot.";
	NPCSexAftermath Player receives "Other" from Vent;

to say VentFoxTongueFucksPlayer:[Player gets fucked by fox's cock-tongue]
	say "     Placeholder.";

to say VentFoxFucksPlayer:[Player gets fucked by the fox.]
	setmonster "Latex Fox";
	now scalevalue of Vent is VentDomSize;
	choose row MonsterID from the Table of Random Critters;
	say "     The fox seems eager to take you, based on the wagging of his tail. Not wanting to keep him waiting, you quickly strip out of your clothes and get onto all fours. As you present your [bodydesc of Player] ass to him, he walks toward you sniffing the air quietly. He presses his nose into your balls gently sniffing them before he moves his nose up to your ass. The vulpine gives a few sniffs there as well before continuing with his plan.";
	if VentFluidAmount is 0: [Average Fluid]
		if anallevel is 3: [Player gets rimmed by Vent]
			if VentDomSize is 3:
				if scalevalue of Player is 1: [Tiny player]
					say "     You have to stifle a gasp as you feel his rubbery tongue sliding in between your ass cheeks, lubricated by his saliva. Vent gives a few long, slow licks up from your taint to the top of your crack, coating you in a thin layer of his drool. After a little bit of this, he switches to circling his tongue around your hole, further slickening you. You gasp again when he presses the rubbery organ against your entrance, pushing it into you slowly, stretching your smaller form around his slippery organ. He wiggles it around inside of you for a little bit before he finally relents, letting his tongue slip out of you, a string of saliva connect the two of you.";
				else if scalevalue of Player is 2: [Small player]
					say "     You have to stifle a gasp as you feel his rubbery tongue sliding in between your ass cheeks, lubricated by his saliva. Vent gives a few long, slow licks up from your taint to the top of your crack, coating you in a thin layer of his drool. After a little bit of this, he switches to circling his tongue around your hole, further slickening you. You gasp again when he presses the rubbery organ against your entrance, pushing it into you slowly, stretching you around that writhing organ. He wiggles it around inside you for a little bit before he finally relents, his tongue sliding out of you, a string of latex saliva connecting the two of you.";
				else if scalevalue of Player is 3: [Average player]
					say "     You have to stifle a gasp as you feel his rubbery tongue sliding in between your ass cheeks, lubricated by his saliva. Vent gives a few long, slow licks up from your taint to the top of your crack, coating you in a thin layer of his drool. After a little bit of this, he switches to circling his tongue around your hole, further slickening you. You gasp again when he presses the rubbery tongue against your entrance, pushing it into you slowly. He wiggles it around inside you for a little bit before he finally relents, his tongue sliding out of you, a string of latex saliva connecting the two of you.";
				else if scalevalue of Player is 4: [Large player]
					say "     Vent rims you.";
				else: [Giant player]
					say "     Vent rims you.";
			else if VentDomSize is 4:
				if scalevalue of Player is 1: [Tiny player]
					say "     Vent rims you.";
				else if scalevalue of Player is 2: [Small player]
					say "     Vent rims you.";
				else if scalevalue of Player is 3: [Average player]
					say "     Vent rims you.";
				else if scalevalue of Player is 4: [Large player]
					say "     Vent rims you.";
				else: [Giant player]
					say "     Vent rims you.";
			else if VentDomSize is 5:
				if scalevalue of Player is 1: [Tiny player]
					say "     Vent rims you.";
				else if scalevalue of Player is 2: [Small player]
					say "     Vent rims you.";
				else if scalevalue of Player is 3: [Average player]
					say "     Vent rims you.";
				else if scalevalue of Player is 4: [Large player]
					say "     Vent rims you.";
				else: [Giant player]
					say "     Vent rims you.";
			else:
				say "     ERROR! You shouldn't be seeing this. If you are, contact @Dys on the FS Discord with the message: VENTDOMSIZE-[VentDomSize]";
			WaitLineBreak;
		else: [Player gets hotdogged by Vent]
			if VentDomSize is 3:
				if scalevalue of Player is 1: [tiny player]
					say "     Vent places a single paw on your upper back, forcing your ass up into the air. He brings his erect vulpine cock up to your ass and begins dragging it up and down, slathering your smaller form in his rubbery pre. With how much smaller your form is, he can't help but to thrust up against your back as well, leaving a slimy trail of fluid there as well. He continues this ritual for a fair bit before he steps back, looking over your slickened form before he gives a huff of approval.";
				else if scalevalue of Player is 2: [small player]
					say "     The rubber vulpine places his paws on your upper back, pushing you down with ease, giving him easy access to your ass. You feel that long, latex shaft of his poking at your entrance before he drags it upwards, leaving a trail of slick pre behind. He continues this ritual for a little while, making sure you're thoroughly lubed up before he removes his paws from your back. You can feel his eyes on you as he observes his work, making sure it'll be good enough for what comes next. Apparently satisfied, he chuffs and moves on.";
				else if scalevalue of Player is 3: [average player]
					say "     The rubber vulpine places his paws on your lower back, pushing you down gently so that he has easy access to your ass. You feel that long, latex shaft of his poking at your entrance before he drags it upwards, leaving a trail of slick pre behind. He continues this ritual for a little while, making sure you're thoroughly lubed up before he removes his paws from your back. You can feel his eyes on you as he observes his work, making sure it'll be good enough for what comes next. Apparently satisfied, he chuffs and moves on.";
				else if scalevalue of Player is 4: [large player]
					say "     Vent hotdogs you.";
				else:
					say "     Vent hotdogs you.";
			else if VentDomSize is 4:
				if scalevalue of Player is 1: [tiny player]
					say "     Vent hotdogs you.";
				else if scalevalue of Player is 2: [small player]
					say "     Vent hotdogs you.";
				else if scalevalue of Player is 3: [average player]
					say "     Vent hotdogs you.";
				else if scalevalue of Player is 4: [large player]
					say "     Vent hotdogs you.";
				else:
					say "     Vent hotdogs you.";
			else if VentDomSize is 5:
				if scalevalue of Player is 1: [tiny player]
					say "     Vent hotdogs you.";
				else if scalevalue of Player is 2: [small player]
					say "     Vent hotdogs you.";
				else if scalevalue of Player is 3: [average player]
					say "     Vent hotdogs you.";
				else if scalevalue of Player is 4: [large player]
					say "     Vent hotdogs you.";
				else:
					say "     Vent hotdogs you.";
			else:
				say "     ERROR! You shouldn't be seeing this. If you are, contact @Dys on the FS Discord with the message: VENTDOMSIZE-[VentDomSize]";
			WaitLineBreak;
		if VentDomSize is 3: [Average-sized Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     You can't help but let out a startled yelp as Vent wraps his long rubber tail around your torso, hoisting your much smaller form into the air. He lays down on his back, holding you just above his erect vulpine maleness. Sensing what the vulpine has planned, you can't help but grin in eager anticipation, spreading your legs so he can more easily penetrate you. He uses his firm grip on your body to pull you downwards, the crown of his massive rubber tool prodding at your entrance. Before he really begins, however, he locks eyes with you, seemingly asking for your go ahead, which you provide readily. You gasp as he pushes you onto his shaft, the girthy length slipping into your tight hole slowly. Your body is forced down on inch after inch of his cock until you finally feel his knot pressing firmly against your entrance. You can't help but grit your teeth from the pain of being stretched so much, your belly bulging outward almost comically in the shape of his cock.";
				say "     Your lover gives you a few moments to adjust before he begins to lift you up, his rubber cock leaving you slowly. Eventually only the tip remains inside you. Before you know it, he's dragging you back down, much faster this time, and his knot is soon pushing against you once more. He repeats this cycle of dragging you up and down for quite some time, building up the pace all the while, until he slams you down one last time, his knot stretching you painfully wide before it manages to slip inside you. It swells even wider, putting immense pressure on your [if Player is male]prostate, causing you to orgasm in sheer bliss[else]walls, drawing an immensely pleasured moan out of you[end if]. Vent lets out a growl of pleasure as he reaches his peak, his shaft pulsing and throbbing inside you as he fills you with his virile seed. The flood of semen nearly instantly bloats you outwards, and by the time the flow abates, you've become decently rounded out.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     With your entrance thoroughly lubricated, the rubber fox mounts you, wrapping his paws around your waist, his long latex cock prodding at your ass. He thrusts against you a few times before he hits his mark, the tapered tip slipping into your hole with a fair amount of resistance. He continues to push into you, his cock stretching you more and more until he manages to bottom out to his knot, bulging out your belly rather noticeably. You're given a few moments to adjust before he pulls back out of you inch by inch, until his tip is the only thing left in your hole. Vent pushes his rubber cock into you a little faster this time, and soon enough, he's built up a rather decent pace. Each thrust rocks your body forward ever so slightly. Eventually his thrusts become shorter and harder, his knot bashing against your entrance.";
				say "     He pushes into you one last time, forcing his knot into your hole with a fair amount of pressure, causing you to cry out in both pain and pleasure. It pops inside before swelling larger and larger. The pressure on your prostate is enough to set you off, your own cock spurting its [Cum Load Size of Player] load onto the ground beneath you. With the two of you tied, he starts to rut into you rapidly. Fairly quickly, he reaches his peak as well, letting out a pleasured yip as rope after rope of rubbery seed spills into you. It takes a fair bit of time before his orgasm abates, and you've been filled with a good amount of his cum in that time, your belly distinctly rounded out.";
			else if scalevalue of Player is 3: [Average player]
				say "     With your entrance thoroughly lubricated, the rubber fox mounts you, wrapping his paws around your waist, his long latex cock prodding at your ass. He thrusts against you a few times before he hits his mark, the tapered tip slipping into your hole with a small amount of resistance. He continues to push into you, his cock stretching you more and more until he manages to bottom out to his knot, a slight bulge in your belly. You're given a few moments to adjust before he pulls back out of you inch by inch, until his tip is the only thing left in your hole. Vent pushes his rubber cock into you a little faster this time, and soon enough, he's built up a rather decent pace. Each thrust rocks your body forward ever so slightly. Eventually his thrusts become shorter and harder, his knot bashing against your entrance.";
				say "     He pushes into you one last time, forcing his knot into your hole with a fair amount of pressure. It pops inside before swelling larger and larger. The pressure on your prostate is enough to set you off, your own cock spurting its [Cum Load Size of Player] load onto the ground beneath you. With the two of you tied, he starts to rut into you rapidly. Fairly quickly, he reaches his peak as well, letting out a pleasured yip as rope after rope of rubbery seed spills into you. It takes a fair bit of time before his orgasm abates, and your just a little bit swollen with his cum at this point.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, not stretching them.";
				say "     Vent knots the player, causing them to bulge very slightly.";
			else: [Giant player]
				say "     Vent penetrates the player with ease.";
				say "     Vent knots the player with ease.";
		else if VentDomSize is 4: [Large Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player with a good amount of effort, stretching them a lot.";
				say "     Vent knots the player, subjecting them to some pain.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, stretching them a good amount.";
				say "     Vent knots the player, stretching them a lot.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player, stretching them a little bit.";
				say "     Vent knots the player, stretching them further.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, barely stretching them.";
				say "     Vent knots the player, stretching them a tiny bit more.";
			else: [Giant player]
				say "     Vent penetrates the player, not stretching them at all.";
				say "     Vent knots the player, stretching them a tiny bit.";
		else if VentDomSize is 5: [Huge Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player, causing them lots of pain and stretching them excessively.";
				say "     Vent barely manages to knot the player, his knot nearly breaking their hips. They're basically a living condom at this point.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, causing them a good amount of pain, stretching them decently.";
				say "     Vent manages to knot the player, inflicting a good amount of pain, stretching them even further.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player with a fair amount of force, causing a little pain, stretching them a good amount.";
				say "     Vent knots the player, stretching them even more.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, stretching them slightly.";
				say "     Vent knots the player, stretching them a little more.";
			else: [Giant player]
				say "     Vent penetrates the player, stretching the barely.";
				say "     Vent knots the player, stretching them a little more.";
		WaitLineBreak;
		say "[VentAnalWS]";
		say "     His knot eventually shrinks enough that he can pull out of your hole, his rubbery tool slipping out with a gentle pop. A trickle of his fluids flow out of your stretched hole, and you can't help but let out a small shudder from the feeling of emptiness you've suddenly been subjected to. Vent gives you a lick on the cheek with his latex tongue before he dismounts you.";
		WaitLineBreak;
		say "[VentPostSexWS]";
		say "     Now that the two of you have been satisfied, Vent gives you a lick goodbye before heading back to his home.";
	if VentFluidAmount is 1: [Above average Fluid]
		if anallevel is 3:
			if VentDomSize is 3:
				say "     Vent rims you with a normal tongue, average drool.";
			else if VentDomSize is 4:
				say "     Vent rims you with a longer tongue, average drool.";
			else if VentDomSize is 5:
				say "     Vent rims you with a long-ass tongue, average drool.";
			else:
				say "     ERROR! You shouldn't be seeing this. If you are, contact @Dys on the FS Discord with the message: VENTDOMSIZE-[VentDomSize]";
			WaitLineBreak; [Player gets rimmed by Vent]
		else: [Player gets hotdogged by Vent]
			if VentDomSize is 3:
				say "     Vent hotdogs you with an average peenor, average pre.";
			else if VentDomSize is 4:
				say "     Vent hotdogs you with a big ol['] dick, average pre.";
			else if VentDomSize is 5:
				say "     Vent hotdogs you with a giant fox cock, average pre.";
			else:
				say "     ERROR! You shouldn't be seeing this. If you are, contact @Dys on the FS Discord with the message: VENTDOMSIZE-[VentDomSize]";
			WaitLineBreak;
		if VentDomSize is 3: [Average-sized Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player, stretching them a good amount.";
				say "     Vent manages to knot the player, stretching them further.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, stretching them a little bit.";
				say "     Vent knots the player, stretching them out a little more.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player, stretching them a tiny amount.";
				say "     Vent knots the player, stretching them out more.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, not stretching them.";
				say "     Vent knots the player, causing them to bulge very slightly.";
			else: [Giant player]
				say "     Vent penetrates the player with ease.";
				say "     Vent knots the player with ease.";
		else if VentDomSize is 4: [Large Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player with a good amount of effort, stretching them a lot.";
				say "     Vent knots the player, subjecting them to some pain.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, stretching them a good amount.";
				say "     Vent knots the player, stretching them a lot.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player, stretching them a little bit.";
				say "     Vent knots the player, stretching them further.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, barely stretching them.";
				say "     Vent knots the player, stretching them a tiny bit more.";
			else: [Giant player]
				say "     Vent penetrates the player, not stretching them at all.";
				say "     Vent knots the player, stretching them a tiny bit.";
		else if VentDomSize is 5: [Huge Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player, causing them lots of pain and stretching them excessively.";
				say "     Vent barely manages to knot the player, his knot nearly breaking their hips. They're basically a living condom at this point.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, causing them a good amount of pain, stretching them decently.";
				say "     Vent manages to knot the player, inflicting a good amount of pain, stretching them even further.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player with a fair amount of force, causing a little pain, stretching them a good amount.";
				say "     Vent knots the player, stretching them even more.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, stretching them slightly.";
				say "     Vent knots the player, stretching them a little more.";
			else: [Giant player]
				say "     Vent penetrates the player, stretching the barely.";
				say "     Vent knots the player, stretching them a little more.";
		WaitLineBreak;
		say "[VentAnalWS]";
		say "     Vent pulls out of you.";
		WaitLineBreak;
		say "[VentPostSexWS]";
		say "     Post sex shit.";
	if VentFluidAmount is 2: [Excessive Fluid]
		if anallevel is 3:
			if VentDomSize is 3:
				say "     Vent rims you with a normal tongue, average drool.";
			else if VentDomSize is 4:
				say "     Vent rims you with a longer tongue, average drool.";
			else if VentDomSize is 5:
				say "     Vent rims you with a long-ass tongue, average drool.";
			else:
				say "     ERROR! You shouldn't be seeing this. If you are, contact @Dys on the FS Discord with the message: VENTDOMSIZE-[VentDomSize]";
			WaitLineBreak; [Player gets rimmed by Vent]
		else: [Player gets hotdogged by Vent]
			if VentDomSize is 3:
				say "     Vent hotdogs you with an average peenor, average pre.";
			else if VentDomSize is 4:
				say "     Vent hotdogs you with a big ol['] dick, average pre.";
			else if VentDomSize is 5:
				say "     Vent hotdogs you with a giant fox cock, average pre.";
			else:
				say "     ERROR! You shouldn't be seeing this. If you are, contact @Dys on the FS Discord with the message: VENTDOMSIZE-[VentDomSize]";
			WaitLineBreak;
		if VentDomSize is 3: [Average-sized Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player, stretching them a good amount.";
				say "     Vent manages to knot the player, stretching them further.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, stretching them a little bit.";
				say "     Vent knots the player, stretching them out a little more.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player, stretching them a tiny amount.";
				say "     Vent knots the player, stretching them out more.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, not stretching them.";
				say "     Vent knots the player, causing them to bulge very slightly.";
			else: [Giant player]
				say "     Vent penetrates the player with ease.";
				say "     Vent knots the player with ease.";
		else if VentDomSize is 4: [Large Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player with a good amount of effort, stretching them a lot.";
				say "     Vent knots the player, subjecting them to some pain.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, stretching them a good amount.";
				say "     Vent knots the player, stretching them a lot.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player, stretching them a little bit.";
				say "     Vent knots the player, stretching them further.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, barely stretching them.";
				say "     Vent knots the player, stretching them a tiny bit more.";
			else: [Giant player]
				say "     Vent penetrates the player, not stretching them at all.";
				say "     Vent knots the player, stretching them a tiny bit.";
		else if VentDomSize is 5: [Huge Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player, causing them lots of pain and stretching them excessively.";
				say "     Vent barely manages to knot the player, his knot nearly breaking their hips. They're basically a living condom at this point.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, causing them a good amount of pain, stretching them decently.";
				say "     Vent manages to knot the player, inflicting a good amount of pain, stretching them even further.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player with a fair amount of force, causing a little pain, stretching them a good amount.";
				say "     Vent knots the player, stretching them even more.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, stretching them slightly.";
				say "     Vent knots the player, stretching them a little more.";
			else: [Giant player]
				say "     Vent penetrates the player, stretching the barely.";
				say "     Vent knots the player, stretching them a little more.";
		WaitLineBreak;
		say "[VentAnalWS]";
		say "     Vent pulls out of you.";
		WaitLineBreak;
		say "[VentPostSexWS]";
		say "     Post sex fun.";
	if VentFluidAmount is 3: [Extreme Fluid]
		if anallevel is 3:
			if VentDomSize is 3:
				say "     Vent rims you with a normal tongue, average drool.";
			else if VentDomSize is 4:
				say "     Vent rims you with a longer tongue, average drool.";
			else if VentDomSize is 5:
				say "     Vent rims you with a long-ass tongue, average drool.";
			else:
				say "     ERROR! You shouldn't be seeing this. If you are, contact @Dys on the FS Discord with the message: VENTDOMSIZE-[VentDomSize]";
			WaitLineBreak; [Player gets rimmed by Vent]
		else: [Player gets hotdogged by Vent]
			if VentDomSize is 3:
				say "     Vent hotdogs you with an average peenor, average pre.";
			else if VentDomSize is 4:
				say "     Vent hotdogs you with a big ol['] dick, average pre.";
			else if VentDomSize is 5:
				say "     Vent hotdogs you with a giant fox cock, average pre.";
			else:
				say "     ERROR! You shouldn't be seeing this. If you are, contact @Dys on the FS Discord with the message: VENTDOMSIZE-[VentDomSize]";
			WaitLineBreak;
		if VentDomSize is 3: [Average-sized Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player, stretching them a good amount.";
				say "     Vent manages to knot the player, stretching them further.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, stretching them a little bit.";
				say "     Vent knots the player, stretching them out a little more.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player, stretching them a tiny amount.";
				say "     Vent knots the player, stretching them out more.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, not stretching them.";
				say "     Vent knots the player, causing them to bulge very slightly.";
			else: [Giant player]
				say "     Vent penetrates the player with ease.";
				say "     Vent knots the player with ease.";
		else if VentDomSize is 4: [Large Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player with a good amount of effort, stretching them a lot.";
				say "     Vent knots the player, subjecting them to some pain.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, stretching them a good amount.";
				say "     Vent knots the player, stretching them a lot.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player, stretching them a little bit.";
				say "     Vent knots the player, stretching them further.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, barely stretching them.";
				say "     Vent knots the player, stretching them a tiny bit more.";
			else: [Giant player]
				say "     Vent penetrates the player, not stretching them at all.";
				say "     Vent knots the player, stretching them a tiny bit.";
		else if VentDomSize is 5: [Huge Vent fuck and tie]
			if scalevalue of Player is 1: [Tiny player]
				say "     Vent penetrates the player, causing them lots of pain and stretching them excessively.";
				say "     Vent barely manages to knot the player, his knot nearly breaking their hips. They're basically a living condom at this point.";
			else if scalevalue of Player is 2: [Smaller player]
				say "     Vent penetrates the player, causing them a good amount of pain, stretching them decently.";
				say "     Vent manages to knot the player, inflicting a good amount of pain, stretching them even further.";
			else if scalevalue of Player is 3: [Average player]
				say "     Vent penetrates the player with a fair amount of force, causing a little pain, stretching them a good amount.";
				say "     Vent knots the player, stretching them even more.";
			else if scalevalue of Player is 4: [Large player]
				say "     Vent penetrates the player, stretching them slightly.";
				say "     Vent knots the player, stretching them a little more.";
			else: [Giant player]
				say "     Vent penetrates the player, stretching the barely.";
				say "     Vent knots the player, stretching them a little more.";
		WaitLineBreak;
		say "[VentAnalWS]";
		say "     Vent pulls out of you.";
		WaitLineBreak;
		say "[VentPostSexWS]";
		say "     Post sex shit.";
	NPCSexAftermath Player receives "AssFuck" from Vent;

to say SuckVentFoxCock:[Player gives Vent a blowjob.]
	say "     Placeholder.";

to say VentFoxSuckCock:[Vent gives player a blowjob.]
	say "     Placeholder.";

Chapter 3 - Watersports

to say VentAnalWS:
	if (VentWSAmount is 2 and a random chance of 1 in 7 succeeds) or (VentWSAmount is 3 and a random chance of 1 in 2 succeeds):
		if VentDomSize is 3: [Average-sized Vent]
			if scalevalue of Player is 3: [Average-sized player]
				if VentFluidAmount is 0: [Average levels of urine.]
					say "     With his knot still engorged, Vent lets out a purr before you feel a hot stream of fluid entering your bowels. It takes you just a moment to realize that he's pissing inside of you, marking you as his. The hot, yellow liquid latex fills you even further, making you swell a bit larger. It's acrid scent seems to permeate from your form, the heady smell making you moan blissfully before that flow finally starts to dwindle as well. Seemingly happy with his work, your foxy friend decides he's simply going to cuddle with you for now as the two of you wait for his knot to deflate enough for him to pull out.";
				else if VentFluidAmount is 1: [Above average levels of urine.]
					say "     Vent pees in your bum while he's knotted to you, inflating you a decent bit.";
				else if VentFluidAmount is 2: [Excessive levels of urine.]
					say "     Vent pees in your butt while he's knotted to you, distending your belly with an excessive amount of piss.";
				else if VentFluidAmount is 3: [Extreme levels of urine.]
					say "     Vent takes a leak in your ass, making you look like you're ready to give birth.";
	else: [No WS.]
		if VentDomSize is 3 and scalevalue of Player > 2: [Vent is average sized and player is not tiny]
			say "     With his knot still engorged, your latex fox friend lays down on top of you, snuggling up against you as you both come down from your respective highs. While you wait for the bulb of rubber to shrink, he goes about cleaning your spilled cum, darting his extendable tongue out of his mouth to lap up the mess[if VentFluidAmount > 1], making sure to lick along your swollen belly as well[end if]. After he finishes with that, he simply opts to curl around you, waiting for his body to calm down. You can't help the feeling of safety that washes over you as you relax in his embrace.";
		else if VentDomSize is 3 and scalevalue of Player <= 2: [Vent is average sized and player is tiny]
			say "     With your tiny form still stuck on his knot and your belly [if VentFluidAmount is 0]swollen[else if VentFluidAmount is 1]obscenely filled[else if VentFluidAmount is 2]grotesquely stuffed and drooping[else]so filled[end if] with his seed[if VentFluidAmount is 3] that it's more than twice the size of your entire form[end if], Vent places a relatively large paw on your [if VentFluidAmount > 2]chest[else]stomach[end if], holding you gently as the two of you come down from your bliss. He gives you a few gentle licks with his rubbery tongue as you both wait for his knot to shrink. You can't help but relax from the feeling of comfort you get from being with your latex friend.";
		else if VentDomSize is 4 and scalevalue of Player > 3: [Vent is large and player is not small]
			say "     Vent lays atop your form, sighing as he comes down from his climax. His tail sways gently behind him.";
		else if VentDomSize is 4 and scalevalue of Player <= 3: [Vent is large and player is small]
			say "     With your tiny body still stuck on his knot, Vent holds you close until his knot deflates.";
		else if VentDomSize is 5 and scalevalue of Player > 4: [Vent is huge and player is not average]
			say "     Vent lays atop your form, sighing as he comes down from his climax. His tail sways gently behind him.";
		else if VentDomSize is 5 and scalevalue of Player <= 4: [Vent is huge and player is average]
			say "     With your tiny body still stuck on his knot, Vent holds you close until his knot deflates.";

to say VentPostSexWS:
	if (VentWSAmount is 2 and a random chance of 1 in 3 succeeds) or (VentWSAmount is 3):
		if Vent is smaller than player or Vent is equalsized with player: [Vent is similar in size to the player]
			say "     <placeholder junk.>";
		else: [Player is significantly smaller than Vent]
			say "     <smaller placeholder junk.>";

Section 6 - Dev Tools

LearnAboutVent is an action applying to nothing.
Understand "learnvent" as LearnAboutVent.

Carry out LearnAboutVent:
	say "     Done.";
	now VentFoxEncounterCount is 3;
	now VentFoxRelationship is 3;

MaxOutVentStats is an action applying to nothing.
Understand "maxvent" as MaxOutVentStats.

Carry out MaxOutVentStats:
	say "     Done.";
	now VentFoxEncounterCount is 3;
	now VentFoxContentLevel is 3;
	now VentFoxRelationship is 3;
	connect Maintenance Garage;

ShowVentStats is an action applying to nothing.
Understand "ventstats" as ShowVentStats.

Carry out ShowVentStats:
	say "VentFoxEncounterCount: [VentFoxEncounterCount].";
	say "VentFoxRelationship: [VentFoxRelationship].";
	say "VentFoxContentLevel: [VentFoxContentLevel].";
	say "VentFoxLastFed: [VentFoxLastFed].";
	say "VentDomSize: [VentDomSize].";
	say "VentSubSize: [VentSubSize].";
	say "VentFluidAmount: [VentFluidAmount].";
	say "VentWSAmount: [VentWSAmount].";
	say "VentOviAmount: [VentOviAmount].";

Vent Fox ends here.
