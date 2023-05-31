import { keywordFormat } from './support/text-formatters.js'

export const NOTE_STEALTH_TOKEN = make({
    name: 'Stealth Token',
    desc: 'A Unit with a Stealth Token cannot be targeted by enemy actions. A Unit looses the token when it makes an attack or an enemy Unit successful scans it or an enemy Unit is within 2" after any Unit ends a move. A Unit cannot gain a Stealth Token if an enemy Unit is within 2" and cannot have more than 1.',
})

export const NOTE_JAMMED = make({
    name: 'JAM',
    desc: 'A Unit suffering the JAM effect becomes Jammed. A Jammed Unit may not spend Command Points to Boost its rolls, but may remove the Jammed status at any time by spending 1 Command Point. A Unit may not be Jammed more than once.',
})

function make(ability) {
    ability.desc = keywordFormat(ability.desc)

    return ability
}
