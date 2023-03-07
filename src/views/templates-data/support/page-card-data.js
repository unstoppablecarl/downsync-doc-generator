import { chunk, getTimestamp } from '../../../data/support/util.js'
import {
    COALITION_DEMO_UNITS,
    COALITION_UNITS,
    SENTINEL_HUNTER,
    SENTINEL_TAGGER,
} from '../../../data/cards/coalition-units.js'
import { REPUBLIC_DEMO_UNITS, REPUBLIC_UNITS } from '../../../data/cards/republic-units.js'
import { CARDS_VERSION } from '../../../versioning.js'
import {
    COALITION_FACTION_NAME,
    COALITION_FACTION_SLUG,
    NOMAD_FACTION_NAME,
    NOMAD_FACTION_SLUG,
    REPUBLIC_FACTION_NAME,
    REPUBLIC_FACTION_SLUG,
} from '../../../data/constants.js'
import { NOMAD_UNITS } from '../../../data/cards/nomad-units.js'

const TIMESTAMP = getTimestamp()

export const FACTION_UNITS = [
    {
        faction: COALITION_FACTION_NAME,
        faction_slug: COALITION_FACTION_SLUG,
        factionCards: prepareCards(COALITION_UNITS),
    },
    {
        faction: REPUBLIC_FACTION_NAME,
        faction_slug: REPUBLIC_FACTION_SLUG,
        factionCards: prepareCards(REPUBLIC_UNITS),
    },
    {
        faction: NOMAD_FACTION_NAME,
        faction_slug: NOMAD_FACTION_SLUG,
        factionCards: prepareCards(NOMAD_UNITS),
    },

    //{
    //    faction: 'Mercenaries',
    //    factionCards: prepareCards(MERCENARY_UNITS),
    //},
]

export const FACTION_DEMO_UNITS = [
    {
        faction: COALITION_FACTION_NAME,
        faction_slug: COALITION_FACTION_SLUG,
        factionCards: prepareCards(COALITION_DEMO_UNITS),
    },
    {
        faction: REPUBLIC_FACTION_NAME,
        faction_slug: REPUBLIC_FACTION_SLUG,
        factionCards: prepareCards(REPUBLIC_DEMO_UNITS),
    },
]

export const ALL_UNITS = FACTION_UNITS.flatMap((faction) => faction.factionCards)

export function cardsToPages(cards, cardsPerPage) {
    return chunk(cards, cardsPerPage)
}

function prepareCards(cards) {
    return cards.map(prepareCard)
}

function prepareCard(card) {
    card.timestamp = TIMESTAMP
    card.cardsVersion = CARDS_VERSION

    let nameWithVariant = card.name

    if (card.variant_name) {
        nameWithVariant += ': ' + card.variant_name
    }
    card.name_with_variant = nameWithVariant
    return card
}

export function prepareSplitCards(targetUnits) {

    const units = targetUnits.filter((item) => {
        if (item.name === SENTINEL_HUNTER.name) {
            return false
        }
        if (item.name === SENTINEL_TAGGER.name) {
            return false
        }
        return true
    })

    units.splice(1, 0, {
        template: 'unit-split-card',
        splitCards: [
            SENTINEL_TAGGER,
            SENTINEL_HUNTER,
        ],
    })

    return units
}
