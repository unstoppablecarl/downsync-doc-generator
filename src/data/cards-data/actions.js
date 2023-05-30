import { keywordFormat } from '../support/text-formatters.js'
import { COST_ACTION_OR_COMMAND, COST_COMMAND } from '../constants.js'
import { makeAction } from '../support/factories.js'

export const FORWARD_OBSERVE = make({
    name: 'Forward Observe',
    cost: COST_ACTION_OR_COMMAND,
    effect: '&starf;',
    desc: 'A Unit in the same Taskforce immediately resolves its activation with an action that has the Fire Support trait using this Unit\'s LOS. This action can be used once per activation.',
})

export const SCAN = (rof, range) => {
    return make({
        name: 'Scanner',
        stat: 'SCAN',
        range: range,
        rof: rof,
        effect: 'reveal',
    })
}

export const SCRAMBLE = make({
    name: 'Scramble',
    note: 'Once per Activation',
    target: 'Unit/Ping',
    cost: COST_COMMAND,
    range: 6,
    effect: '&starf;',
    desc: 'Select another friendly Unit within 6", it gains a Stealth Token',
    or_desc: 'Select an enemy Ping within 6" and LOS, That Ping may not be Revealed while within 6" of this Unit until the end of this Round.',
    desc2: 'Scramble may be used once per Unit Activation.',
    traits: [],
})

export const TRANSPORT_UNLOAD = make({
    name: 'Unload',
    note: 'Free Action, 3"',
    desc: keywordFormat(`The carried Unit is Placed within 3". They become part of the current Taskforce and may immediately perform an action then gain an Activated Token. If the Unloading Unit performs a Move Action it may not move within 2" of an enemy Ping.`),
    no_stats: true,
})

export const TRANSPORT_LOAD = make({
    name: 'Load',
    note: 'Free Action, 3"',
    desc: keywordFormat(`Place an eligible Unit within 3" in this transport up to its max capacity. Units must forfeit a move or action are eligible. This Unit cannot perform a Load and an Unload action in the same activation.`),
    no_stats: true,
})

export const GO_DARK = make({
    name: 'Go Dark',
    cost: COST_COMMAND,
    effect: '&starf;',
    desc: 'This Unit gains a Stealth Token.',
})

export const BASIC_SCAN = SCAN(1, 12)

function make(action) {
    return makeAction(action)
}
